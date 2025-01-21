import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/services/auction.service.dart';

class CreateAuctionWidget extends StatefulWidget {
  const CreateAuctionWidget({super.key});

  @override
  State<CreateAuctionWidget> createState() => _CreateAuctionWidgetState();
}

class _CreateAuctionWidgetState extends State<CreateAuctionWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _auctionService = AuctionService();
  final _authProvider = AuthProvider();

  bool _isValid = false;
  bool _isSubmitting = false;

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
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderTextField(
        name: name,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: FormBuilderDateTimePicker(
        name: name,
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

  Future<void> _handleSubmit() async {
    if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
      return;
    }

    setState(() {
      _isSubmitting = true;
    });

    try {
      await _auctionService.create(
        _formKey.currentState!.value,
        _authProvider.auth.currentUser!.uid,
      );

      if (!mounted) return;
      Navigator.pop(context);
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Create Auction',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
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
                      Text(
                        'Auction Details',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 24),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
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
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : const Text(
                  'Create Auction',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
