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

class CreateListingWidget extends StatefulWidget {
  const CreateListingWidget({super.key, required this.auctionId});
  final String auctionId;

  @override
  State<CreateListingWidget> createState() => _CreateListingWidget();
}

class _CreateListingWidget extends State<CreateListingWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _listingService = ListingService();
  List<XFile> _images = [];
  final bool _isOffline = false;
  late String uid;
  late ListingModel model;

  @override
  void initState() {
    super.initState();
  }

  Future<String> _getUid() {
    final completer = Completer<String>();
    final authProvider = Provider.of<AuthProvider>(context);

    uid = authProvider.auth.currentUser!.uid;
    completer.complete(uid);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getUid(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(title: const Text("Add Listing")),
                body: SingleChildScrollView(
                    child: Column(children: [
                  Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: getListingForm(context))
                ])));
          }

          return const CircularProgressIndicator();
        }));
  }

  Widget getListingForm(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Column(children: [
          getField('Title', 'title'),
          getNumberField('Bid Increment', 'bidIncrement'),
          getNumberField('Start Price', 'startPrice'),
          Text('${_images.length}'),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    availableCameras().then((availableCameras) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CameraWidget(
                              camera: availableCameras.first,
                              callback: (List<XFile> images) =>
                                  setState(() => _images = images))));
                    });
                  },
                  child: const Icon(Icons.camera))
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    model = ListingModel.fromJson(_formKey.currentState!.value);
                    if (_isOffline) {
                      _listingService
                          .create(model, widget.auctionId)
                          .then((value) {
                        _processImagesOffline(value);
                        Navigator.pop(context);
                      });
                    } else {
                      _processImages().then((images) {
                        model.images = images;
                        _listingService
                            .create(model, widget.auctionId)
                            .then((value) {
                          Navigator.pop(context);
                        });
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
      for (int i = 0; i < _images.length; i++) {
        final bytes = await File(_images[i].path).readAsBytes();
        await cloudinary
            .upload(_images[i], bytes, (count, total) {})
            .then((response) {
          print('upload response ${response.toString()}');
          return processedImages.add(response.url!);
        }).onError((error, stackTrace) => print('error ${error.toString()}'));
        print('completed');
      }

      completer.complete(processedImages);
    } catch (e) {
      print('error ${e}');
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
