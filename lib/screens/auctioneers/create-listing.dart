import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/screens/camera.dart';
import 'package:absentee/services/listing.service.dart';
import 'package:absentee/utils/form.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class CreateListingWidget extends StatefulWidget {
  const CreateListingWidget({super.key});

  @override
  State<CreateListingWidget> createState() => _CreateListingWidget();
}

class _CreateListingWidget extends State<CreateListingWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _listingService = ListingService();
  String? uid;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (uid == null) {
      final authProvider = Provider.of<AuthProvider>(context);
      uid = authProvider.auth.currentUser!.uid;
    }
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
          getField('Title', 'title'),
          getNumberField('Bid Increment', 'bidIncrement'),
          getNumberField('Start Price', 'startPrice'),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    availableCameras().then((availableCameras) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CameraWidget(camera: availableCameras.first)));
                    });
                  },
                  child: const Icon(Icons.camera))
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.saveAndValidate() ?? false) {
                    debugPrint(_formKey.currentState?.value.toString());
                    _listingService
                        .create(_formKey.currentState!.value, uid!)
                        .then((value) {
                      Navigator.pop(context);
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
}
