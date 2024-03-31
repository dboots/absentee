import 'dart:async';
import 'dart:io';

import 'package:absentee/models/listing/listing.dart';
import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/screens/camera.dart';
import 'package:absentee/services/listing.service.dart';
import 'package:absentee/services/upload.service.dart';
import 'package:absentee/utils/form.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

import '../../utils/ListingImage.dart';

class CreateListingWidget extends StatefulWidget {
  const CreateListingWidget(
      {super.key, required this.auctionId, this.listingId});
  final String auctionId;
  final String? listingId;

  @override
  State<CreateListingWidget> createState() => _CreateListingWidget();
}

class _CreateListingWidget extends State<CreateListingWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _listingService = ListingService();
  List<File> _images = [];
  List<File> _imagesQueue = [];
  final bool _isOffline = false;
  bool _isInitialized = false;
  late String uid;
  late ListingModel model = ListingModel(title: '');

  @override
  void initState() {
    super.initState();
    model.images = [];
  }

  Future<dynamic> _initListing() async {
    final Completer<dynamic> completer = Completer<dynamic>();
    final String? listingId =
        widget.listingId!.isNotEmpty ? widget.listingId : null;

    if (listingId != null) {
      await _listingService.single(listingId).then((value) {
        List<File> modelImages = [];
        for (var element in value.images ?? []) {
          modelImages.add(File(element));
        }
        model = value;
        model.images = value.images ?? [];

        setState(() {
          _images = modelImages;
        });
        completer.complete(value);
      });
    } else {
      completer.complete(null);
    }

    return completer.future;
  }

  Future<String> _getUid() async {
    final completer = Completer<String>();
    final authProvider = Provider.of<AuthProvider>(context);

    if (widget.listingId != null && !_isInitialized) {
      await _initListing().then((value) {
        uid = authProvider.auth.currentUser!.uid;
        _isInitialized = true;
        completer.complete(uid);
      }, onError: (err) => print(err));
    } else {
      uid = authProvider.auth.currentUser!.uid;
      completer.complete(uid);
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUid(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(
                    title: Text(
                        widget.listingId != null ? "Update Lot" : "Add Lot")),
                body: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: getListingForm(context))
                ])));
          }

          return Container();
        });
  }

  Widget getListingForm(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Column(children: [ 
          getField('Title', 'title', value: model.title),
          getField('Describe this lot in as much detail as possible...', 'description', isTextarea: true, value: model.description),
          getField('Measurements', 'measurements',
              value: model.measurements, isRequired: false),
          getField('Lot Number', 'lotNumber', value: model.lotNumber),
          getField('Location', 'location',
              value: model.location, isRequired: false),
          getNumberField('Quantity', 'quantity', value: model.quantity),
          // getField('Seller', 'sellerId', value: model.sellerId),
          Row(
            children: [
              OutlinedButton(
                  child: const Text('Add Images'),
                  onPressed: () {
                    availableCameras().then((availableCameras) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraWidget(
                              camera: availableCameras.first,
                              callback: (List<File> images) {
                                _imagesQueue = images;
                                setState(() {
                                  _images = [..._images, ...images];
                                  print('images done $_images');
                                });
                              })));
                    });
                  }),
            ],
          ),
          Wrap(
              children: _images
                  .asMap()
                  .entries
                  .map((entry) => ListingImage(
                      imageUrl: entry.value.path,
                      index: entry.key,
                      onRemove: (index) {
                        setState(() {
                          _images.removeAt(index);
                          model.images!.removeWhere((image) => image == entry.value.path);
                        });
                      }))
                  .toList()),
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    model = ListingModel.fromJson({
                      ..._formKey.currentState!.value,
                      'images': model.images
                    });
                    print('model $model');
                    if (_isOffline) {
                      if (widget.listingId != null) {
                        _listingService
                            .update(model, widget.listingId!)
                            .then((value) {
                          _processImagesOffline(widget.listingId!);
                          Navigator.pop(context);
                        });
                      } else {
                        _listingService
                            .create(model, widget.auctionId)
                            .then((value) {
                          _processImagesOffline(value);
                          Navigator.pop(context);
                        });
                      }
                    } else {
                      _processImages().then((images) {
                        model.images?.addAll(images);
                        if (widget.listingId != null) {
                          _listingService
                              .update(model, widget.listingId!)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        } else {
                          _listingService
                              .create(model, widget.auctionId)
                              .then((value) {
                            Navigator.pop(context);
                          });
                        }
                      });
                    }
                  } else {
                    debugPrint('validation failed');
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ]));
  }

  Future<List<String>> _processImages() async {
    Completer<List<String>> completer = Completer<List<String>>();
    List<String> processedImages = [];

    try {
      final cloudinary = UploadService();
      for (int i = 0; i < _imagesQueue.length; i++) {
        final bytes = await File(_imagesQueue[i].path).readAsBytes();
        await cloudinary
            .upload(_images[i], bytes, (count, total) {})
            .then((response) {
          return processedImages.add(response.url!);
        }).onError((error, stackTrace) => print('error ${error.toString()}'));
      }

      completer.complete(processedImages);
    } catch (e) {
      print('error $e');
      //completer.completeError(e);
    }

    return completer.future;
  }

  void _processImagesOffline(String listingId) {
    for (var i = 0; i < _images.length; i++) {
      _listingService.queueListingUpload(_images[i], uid, listingId);
    }
  }
}
