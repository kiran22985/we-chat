import 'dart:developer';

import 'package:chat_app/api/apis.dart';
import 'package:chat_app/models/chat_user_model.dart';
import 'package:chat_app/screens/auth/profile_screen.dart';
import 'package:chat_app/widgets/chat_user_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ChatUser> listOfUsers = [];
  @override
  void initState() {
    super.initState();
    APIs.getSelfInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar//
      appBar: AppBar(
        leading: const Icon(CupertinoIcons.home),
        title: const Text('We Chat'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProfileScreenPage(
                              user: APIs.me,
                            )));
              },
              icon: const Icon(Icons.more_vert)),
        ],
      ),

      body: StreamBuilder(
          stream: APIs.getAllUsers(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              //if data is loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              //when some of all data is loaded then show it
              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.docs;
                listOfUsers =
                    data?.map((e) => ChatUser.fromJson(e.data())).toList() ??
                        [];
                if (listOfUsers.isNotEmpty) {
                  return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: listOfUsers.length,
                      itemBuilder: (context, index) {
                        return ChatUserCard(
                          user: listOfUsers[index],
                        );
                      });
                } else {
                  return const Center(
                    child: Text('No connections Found'),
                  );
                }
            }
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
