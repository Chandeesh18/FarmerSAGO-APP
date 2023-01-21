import 'package:farmers_sago/Town_Name.dart';
import 'package:farmers_sago/gdf.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farmers_sago/screens/signin_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBoYVYlK4K208ciHl0mEib3jpwbryTPLzs",
      appId: "1:569862400185:android:7ccb9e601cfe8f18ba5368",
      messagingSenderId:
          "569862400185-7h2p7rqab8732gp5jbhdagnm6ma70b3v.apps.googleusercontent.com",
      projectId: "farmerssago",
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MediaQuery(data: MediaQueryData(), child: MaterialApp());
    return MaterialApp(
      title: 'Farmers_SAGO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignInScreen(),
    );
  }
}
