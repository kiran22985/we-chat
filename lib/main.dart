import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:chat_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

late Size mq;

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 1,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.normal),
            backgroundColor: Colors.white,
          )),
      home: const LoginScreen(),
    );
  }
}
