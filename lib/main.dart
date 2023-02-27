import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/screens/auctioneers/dashboard.dart';
import 'package:absentee/screens/auctioneers/create-listing.dart';
import 'package:absentee/screens/listing.dart';
import 'package:absentee/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Absentee.bid'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription subscription;
  ConnectivityResult connectivityResult = ConnectivityResult.none;

  @override
  void initState() {
    super.initState();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print(result);
      setState(() {
        connectivityResult = result;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email Address',
                ),
              ),
              TextFormField(
                obscureText: false,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const Padding(padding: EdgeInsets.all(25.0)),
              ElevatedButton(
                  onPressed: () async {
                    authProvider
                        .signInWithEmailAndPassword(
                            'don@donboots.com', 'test123!z')
                        .then((value) => Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) =>
                                    AuctioneerDashboardWidget())))
                        .catchError((err) => print(err));
                  },
                  child: const Text("LOGIN")),
              Text('Status: $connectivityResult')
            ])));
  }
}
