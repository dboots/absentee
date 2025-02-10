import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:absentee/models/auction/auction.dart';
import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:absentee/services/upload.service.dart';
import 'package:camera/camera.dart';
import 'package:absentee/screens/camera.dart';

class CreateAuctionWidget extends StatefulWidget {
  final String? auctionId;
  final AuctionModel? initialAuction;

  const CreateAuctionWidget({
    super.key,
    this.auctionId,
    this.initialAuction,
  });

  @override
  State<CreateAuctionWidget> createState() => _CreateAuctionWidgetState();
}

class _CreateAuctionWidgetState extends State<CreateAuctionWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _auctionService = AuctionService();
  final _authProvider = AuthProvider();
  final _uploadService = UploadService();

  bool _isValid = false;
  bool _isSubmitting = false;
  File? _coverImage;
  String? _coverImageUrl;
  bool get _isEditing => widget.auctionId != null;
  AuctionModel? _auction;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  void _initializeData() {
    print('init ${widget.auctionId}');
    if (widget.auctionId != null) {
      print('widget.initialAuction ${widget.initialAuction}');
      setState(() {
        _auction = widget.initialAuction;
        //_coverImageUrl = widget.initialAuction!.coverImage;
        _isValid = true;
      });
    }
  }

  Widget _buildFormField(
    String label,
    String name, {
    bool isTextArea = false,
    bool isRequired = true,
    bool isNumber = false,
    String? initialValue,
  }) {
    // Get the value from the auction model if no initial value is provided
    final modelValue = _auction?.toJson()[name]?.toString();
    final value = initialValue ?? modelValue;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderTextField(
        name: name,
        controller: TextEditingController(text: value),
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

  Widget _buildDateField(String label, String name) {
    final modelValue = _auction?.toJson()[name];
    DateTime? initialDate;

    if (modelValue != null) {
      try {
        initialDate = DateTime.parse(modelValue.toString());
      } catch (e) {
        print('Error parsing date: $e');
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderDateTimePicker(
        name: name,
        initialValue: initialDate,
        inputType: InputType.date,
        decoration: _getInputDecoration(label),
        validator: (value) {
          if (value == null) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
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
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor.withOpacity(0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      filled: true,
      fillColor: Theme.of(context).cardColor,
    );
  }

  Widget _buildImagePicker() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cover Image',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          if (_coverImage != null || _coverImageUrl != null)
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: _coverImage != null
                      ? Image.file(
                          _coverImage!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          _coverImageUrl!,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.grey[300],
                              child: const Icon(Icons.error),
                            );
                          },
                        ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _coverImage = null;
                        _coverImageUrl = null;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            )
          else
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        size: 48,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Add Cover Image',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final cameras = await availableCameras();
    if (!mounted) return;

    final result = await Navigator.of(context).push<List<File>>(
      MaterialPageRoute(
        builder: (context) => CameraWidget(
          camera: cameras.first,
          callback: (List<File> images) {
            if (images.isNotEmpty) {
              setState(() {
                _coverImage = images.first;
              });
            }
          },
        ),
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _coverImage = result.first;
        _coverImageUrl = null;
      });
    }
  }

  Future<void> _handleSubmit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      // Handle image upload if there's a new image
      if (_coverImage != null) {
        final bytes = await _coverImage!.readAsBytes();
        final response = await _uploadService.upload(
          _coverImage!,
          bytes,
          (count, total) {}, // Progress callback
        );
        _coverImageUrl = response.url;
      }

      final formData = _formKey.currentState!.value;
      final auctionData = {
        ...formData,
        'coverImage': _coverImageUrl,
        if (_isEditing) ...{
          'userId': _auction?.userId,
        },
      };

      late final AuctionModel updatedAuction;

      if (_isEditing && widget.auctionId != null) {
        // Update existing auction
        updatedAuction = await _auctionService.update(
          auctionData,
          widget.auctionId!,
        );
      } else {
        // Create new auction
        updatedAuction = await _auctionService.create(
          auctionData,
          _authProvider.auth.currentUser!.uid,
        );
      }

      if (!mounted) return;
      Navigator.pop(context, updatedAuction);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          _isEditing ? 'Edit Auction' : 'Create Auction',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FormBuilder(
                  key: _formKey,
                  onChanged: () {
                    setState(() {
                      _isValid = _formKey.currentState!.isValid;
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildImagePicker(),
                      _buildFormField('Title', 'title'),
                      _buildFormField('Address', 'address'),
                      Row(
                        children: [
                          Expanded(
                            child: _buildFormField('City', 'city'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildFormField('State', 'state'),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: _buildDateField('Start Date', 'startDate'),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildDateField('End Date', 'endDate'),
                          ),
                        ],
                      ),
                      _buildFormField(
                        'Terms and Conditions',
                        'terms',
                        isTextArea: true,
                      ),
                      _buildFormField('Auction By Order Of', 'byOrderOf'),
                      _buildFormField(
                        'Premium (%)',
                        'premium',
                        isNumber: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomPadding),
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
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isValid && !_isSubmitting ? _handleSubmit : null,
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
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      )
                    : Text(
                        _isEditing ? 'Update Auction' : 'Create Auction',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
