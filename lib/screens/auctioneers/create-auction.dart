import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:absentee/utils/form.dart';

class CreateAuctionWidget extends StatefulWidget {
  const CreateAuctionWidget({super.key});

  @override
  State<CreateAuctionWidget> createState() => _CreateAuctionWidgetState();
}

class _CreateAuctionWidgetState extends State<CreateAuctionWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _auctionService = AuctionService();
  final _authProvider = AuthProvider();
  bool isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Create Auction')),
        body: SingleChildScrollView(child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: getListingForm(context))
        ])));
  }

  Widget getListingForm(BuildContext context) {
    return FormBuilder(
        onChanged: () {
          setState(() {
            isValid = _formKey.currentState!.isValid;
          });
        },
        key: _formKey,
        child: Column(children: [
          getField('Title', 'title'),
          getField('Address', 'address'),
          getField('City', 'city'),
          getField('State', 'state'),
          getDatePickerField('Start Date', 'startDate'),
          getDatePickerField('End Date', 'endDate'),
          getField('Terms', 'terms', isTextarea: true),
          getField('Auction By Order Of', 'byOrderOf'),
          getNumberField('Premium', 'premium'),
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    print('creating');
                    print(_formKey.currentState!.value);
                    _auctionService
                        .create(_formKey.currentState!.value,
                            _authProvider.auth.currentUser!.uid)
                        .then((value) {
                      Navigator.of(context).pop();
                    });
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
}
