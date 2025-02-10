import 'package:absentee/providers/online.provider.dart';
import 'package:absentee/screens/login.dart';
import 'package:absentee/providers/auth.provider.dart';
import 'package:absentee/screens/auctioneers/dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  //FirebaseDatabase.instance.setPersistenceEnabled(true);

  final presenceRef = FirebaseDatabase.instance.ref("disconnectmessage");
// Write a string when this client loses connection
  presenceRef.onDisconnect().set("I disconnected!");

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => OnlineStatusProvider()),
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
      title: 'Absentee.bid',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Lato',
      ),
      home: const MainPage(title: 'Absentee.bid'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final AuthProvider _authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    if (_authProvider.auth.currentUser != null) {
      return const AuctioneerDashboardWidget();
    } else {
      return const LoginWidget();
    }
  }
}
