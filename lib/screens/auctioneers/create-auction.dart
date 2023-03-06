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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Listing")),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: getListingForm(context))
        ])));
  }

  Widget getListingForm(BuildContext context) {
    return FormBuilder(
        key: _formKey,
        child: Column(children: [
          getField('Description', 'description'),
          getField('Address', 'address'),
          getField('City', 'city'),
          getField('State', 'state'),
          getDatePickerField('Start Date', 'startDate'),
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: _formKey.currentState != null &&
                        _formKey.currentState!.saveAndValidate()
                    ? () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          _auctionService
                              .create(_formKey.currentState!.value,
                                  _authProvider.auth.currentUser!.uid)
                              .then((value) {
                            Navigator.of(context).pop();
                          });
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      }
                    : null,
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ]));
  }
}
