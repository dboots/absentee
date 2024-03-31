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
  bool isValid = true;
  String error = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FormBuilder(
                  onChanged: () {
                    setState(() {
                      isValid = _formKey.currentState!.isValid;
                    });
                  },
                  key: _formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getField('Email Address', 'email'),
                        getField('Password', 'password', isPassword: true),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: ElevatedButton(
                            onPressed: isValid
                                ? () {
                                    print(_formKey
                                        .currentState!.fields['email']!.value);
                                    _authProvider
                                        .signInWithEmailAndPassword(
                                            _formKey.currentState!
                                                .fields['email']!.value,
                                            _formKey.currentState!
                                                .fields['password']!.value)
                                        .then((value) {
                                          print('here $value');
                                      if (value) {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AuctioneerDashboardWidget()));
                                      } else {
                                        print('errr');
                                        setState(() {
                                          error = _authProvider.error;
                                        });
                                      }
                                    });
                                  }
                                : null,
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Text(error),
                      ])))),
    );
  }
}
