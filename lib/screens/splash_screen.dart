import 'package:chat_app/main.dart';
import 'package:chat_app/screens/auth/login_screen.dart';
import 'package:chat_app/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      // exit full screen//
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      //app bar//
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),
      ),
      body: Stack(
        children: [
          Positioned(
              top: mq.height * 0.15,
              right: mq.width * .25,
              width: mq.width * .5,
              child: Image.asset('assets/images/chat.png')),
          Positioned(
              bottom: mq.height * 0.15,
              width: mq.width,
              child: const Text(
                'MADE IN NEPAL',
                textAlign: TextAlign.center,
                style: TextStyle(letterSpacing: 5, fontSize: 20),
              )),
        ],
      ),
    );
  }
}
