import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

Widget getField(String label, String name,
    {bool isPassword = false, bool isRequired = true, dynamic value, bool isTextarea = false}) {
  final List<String? Function(dynamic)> validators = [];

  if (isRequired) {
    validators.add(FormBuilderValidators.required());
  }

  return FormBuilderTextField(
      name: name,
      maxLines: isTextarea ? 5 : 1,
      initialValue: value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose(validators),
      decoration: InputDecoration(labelText: label, alignLabelWithHint: true),
      obscureText: isPassword ? true : false);
}

Widget getDatePickerField(String label, String name, {bool isRequired = true}) {
  final List<String? Function(dynamic)> validators = [];

  if (isRequired) {
    validators.add(FormBuilderValidators.required());
  }
  return FormBuilderDateTimePicker(
    name: name,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: FormBuilderValidators.compose(validators),
    decoration: InputDecoration(labelText: label),
    initialEntryMode: DatePickerEntryMode.calendar,
  );
}

Widget getNumberField(String label, String name,
    {dynamic value, bool isRequired = true}) {
  final List<String? Function(dynamic)> validators = [];

  if (isRequired) {
    validators.add(FormBuilderValidators.required());
  }
  print(value);
  return FormBuilderTextField(
    initialValue: (value != null ? value.toString() : '1'),
    name: name,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: FormBuilderValidators.compose(validators),
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    decoration: InputDecoration(labelText: label),
    valueTransformer: (text) => num.tryParse(text!),
  );
}
