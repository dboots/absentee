import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

Widget getField(String label, String name, {bool isPassword = false}) {
  return FormBuilderTextField(
    name: name,
    decoration: InputDecoration(labelText: label),
    obscureText: isPassword ? true : false,
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
    ]),
    onChanged: (val) {
      print(val);
    }
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

Widget getNumberField(String label, String name) {
  return FormBuilderTextField(
    name: name,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    decoration: InputDecoration(labelText: label),
    valueTransformer: (text) => num.tryParse(text!),
    onChanged: (val) {
      print(val); // Print the text value write into TextField
    },
  );
}
