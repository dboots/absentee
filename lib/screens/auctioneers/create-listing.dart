import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/services/auction.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class CreateListingWidget extends StatelessWidget {
  CreateListingWidget({super.key});

  final _formKey = GlobalKey<FormBuilderState>();
  final _auctionService = AuctionService();
  late final String uid;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    uid = authProvider.auth.currentUser!.uid;
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
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    debugPrint(_formKey.currentState?.value.toString());
                    _auctionService.create(_formKey.currentState!.value, uid).then((value) {
                      print('created!');
                      print(value);
                    });
                  } else {
                    debugPrint(_formKey.currentState?.value.toString());
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

  Widget getField(String label, String name) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(labelText: label),
      onChanged: (val) {
        print(val); // Print the text value write into TextField
      },
    );
  }

  Widget getDatePickerField(String label, String name) {
    return FormBuilderDateTimePicker(
      name: name,
      decoration: InputDecoration(labelText: label),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialValue: DateTime.now(),
      onChanged: (val) {
        print(val); // Print the text value write into TextField
      },
    );
  }
}
