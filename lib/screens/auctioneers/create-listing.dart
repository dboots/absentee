import 'dart:async';
import 'dart:io';
import 'package:absentee/providers/online.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'package:camera/camera.dart';
import 'package:absentee/models/listing/listing.dart';
import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/screens/camera.dart';
import 'package:absentee/services/listing.service.dart';
import 'package:absentee/services/upload.service.dart';
import 'package:absentee/utils/ListingImage.dart';

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
  bool _isInitialized = false;
  bool _isSubmitting = false;
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
        widget.listingId?.isNotEmpty ?? false ? widget.listingId : null;

    if (listingId != null) {
      try {
        final value = await _listingService.single(listingId);
        List<File> modelImages =
            value.images?.map((e) => File(e)).toList() ?? [];

        setState(() {
          model = value;
          model.images = value.images ?? [];
          _images = modelImages;
        });

        completer.complete(value);
      } catch (e) {
        completer.completeError(e);
      }
    } else {
      completer.complete(null);
    }

    return completer.future;
  }

  Future<String> _getUid() async {
    if (widget.listingId != null && !_isInitialized) {
      await _initListing();
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      uid = authProvider.auth.currentUser!.uid;
      _isInitialized = true;
      return uid;
    }

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return authProvider.auth.currentUser!.uid;
  }

  InputDecoration _getInputDecoration(String label, {bool isTextArea = false}) {
    return InputDecoration(
      labelText: label,
      alignLabelWithHint: isTextArea,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide:
            BorderSide(color: Theme.of(context).primaryColor.withOpacity(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      ),
      filled: true,
      fillColor: Theme.of(context).cardColor,
    );
  }

  Widget _buildFormField(
    String label,
    String name, {
    bool isTextArea = false,
    bool isRequired = true,
    String? value,
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderTextField(
        name: name,
        initialValue: value,
        maxLines: isTextArea ? 5 : 1,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: _getInputDecoration(label, isTextArea: isTextArea),
        validator: isRequired
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              }
            : null,
      ),
    );
  }

  Widget _buildImageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Images',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton.icon(
                onPressed: _addImages,
                icon: const Icon(Icons.camera_alt),
                label: const Text('Add Images'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              if (_images.isNotEmpty) ...[
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _images
                      .asMap()
                      .entries
                      .map((entry) => ListingImage(
                            imageUrl: entry.value.path,
                            index: entry.key,
                            onRemove: _removeImage,
                          ))
                      .toList(),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }

  void _addImages() async {
    final cameras = await availableCameras();
    if (!mounted) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CameraWidget(
          camera: cameras.first,
          callback: (List<File> images) {
            setState(() {
              _imagesQueue = images;
              _images = [..._images, ...images];
            });
          },
        ),
      ),
    );
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
      if (model.images != null && model.images!.isNotEmpty) {
        model.images!.removeAt(index);
      }
    });
  }

  Future<void> _handleSubmit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      model = ListingModel.fromJson(
          {..._formKey.currentState!.value, 'images': model.images});

      final onlineStatus = Provider.of<OnlineStatusProvider>(context, listen: false);
      print(onlineStatus.isOnline);
      if (!onlineStatus.isOnline) {
        _handleOfflineSubmit();
      } else {
        await _handleOnlineSubmit();
      }

      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isSubmitting = false;
      });
    }
  }

  void _handleOfflineSubmit() async {
    if (widget.listingId != null) {
      _listingService.update(model, widget.listingId!);
      _processImagesOffline(widget.listingId!);
    } else {
          _listingService.create(model, widget.auctionId).then((value) => {
            print('listing created, processing offline images'),
            _processImagesOffline(value)
          }
      );
    }
  }

  Future<void> _handleOnlineSubmit() async {
    final List<String> processedImages = await _processImages();
    model.images?.addAll(processedImages);

    if (widget.listingId != null) {
      await _listingService.update(model, widget.listingId!);
    } else {
      await _listingService.create(model, widget.auctionId);
    }
  }

  Future<List<String>> _processImages() async {
    final List<String> processedImages = [];
    final cloudinary = UploadService();

    for (final image in _imagesQueue) {
      final bytes = await File(image.path).readAsBytes();
      final response = await cloudinary.upload(image, bytes, (count, total) {});
      processedImages.add(response.url!);
    }

    return processedImages;
  }

  void _processImagesOffline(String listingId) {
    print('processing offline images');
    for (var image in _images) {
      _listingService.queueListingUpload(image, uid, listingId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getUid(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              widget.listingId != null ? 'Update Listing' : 'Create Listing',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FormBuilder(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildFormField('Title', 'title', value: model.title),
                    _buildFormField(
                      'Description',
                      'description',
                      isTextArea: true,
                      value: model.description,
                    ),
                    _buildFormField(
                      'Measurements',
                      'measurements',
                      value: model.measurements,
                      isRequired: false,
                    ),
                    _buildFormField(
                      'Lot Number',
                      'lotNumber',
                      value: model.lotNumber,
                    ),
                    _buildFormField(
                      'Location',
                      'location',
                      value: model.location,
                      isRequired: false,
                    ),
                    _buildFormField(
                      'Quantity',
                      'quantity',
                      value: model.quantity.toString(),
                      isNumber: true,
                    ),
                    const SizedBox(height: 16),
                    _buildImageSection(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: _isSubmitting ? null : _handleSubmit,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: _isSubmitting
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : const Text(
                      'Save Listing',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
