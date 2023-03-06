import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/screens/auctioneers/dashboard.dart';
import 'package:absentee/utils/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final AuthProvider _authProvider = AuthProvider();
  bool isValid = false;
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: FormBuilder(
              onChanged: () {
                setState(() {
                  isValid = _formKey.currentState!.saveAndValidate();
                });
              },
              key: _formKey,
              child: Column(children: [
                getField('Email Address', 'email'),
                getField('Password', 'password', isPassword: true),
                Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ElevatedButton(
                      onPressed: isValid
                          ? () => {
                                _authProvider
                                    .signInWithEmailAndPassword(
                                        _formKey.currentState!.fields['email']!
                                            .value,
                                        _formKey.currentState!
                                            .fields['password']!.value)
                                    .then((value) {
                                  if (value) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AuctioneerDashboardWidget()));
                                  } else {
                                    setState(() {
                                      error = _authProvider.error;
                                    });
                                  }
                                })
                              }
                          : null,
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Text(error)
              ]))),
    );
  }
}
