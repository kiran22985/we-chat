import 'dart:developer';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/widgets/chat_user_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar//
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text('We Chat'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),

      body: StreamBuilder(
          stream: APIs.firestore.collection('users').snapshots(),
          builder: (context, snapshot) {
            final listOfUsers = [];
            if (snapshot.hasData) {
              final data = snapshot.data?.docs;
              for (var item in data!) {
                log('Data : ${item.data()}');
                listOfUsers.add(item.data()['name']);
              }
            }
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: listOfUsers.length,
                itemBuilder: (context, index) {
                  return Text('Name : ${listOfUsers[index]}');
                });
          }),
      //floating action button to add new user//
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await APIs.auth.signOut();
          await GoogleSignIn().signOut();
        },
        child: const Icon(Icons.add_comment_rounded),
      ),
    );
  }
}
