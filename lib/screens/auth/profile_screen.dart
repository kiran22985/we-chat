import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/api/apis.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user_model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreenPage extends StatefulWidget {
  final ChatUser user;
  const ProfileScreenPage({super.key, required this.user});

  @override
  State<ProfileScreenPage> createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar//
      appBar: AppBar(
        title: const Text('Profile Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mq.height * 0.03, vertical: mq.height * 0.03),
        child: Column(
          children: [
            SizedBox(
              width: mq.height * 0.03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(mq.height * 0.1),
              child: CachedNetworkImage(
                width: mq.height * 0.2,
                height: mq.height * 0.2,
                fit: BoxFit.fill,
                imageUrl: widget.user.image,
                // placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => const CircleAvatar(
                  child: Icon(CupertinoIcons.person),
                ),
              ),
            ),
            SizedBox(
              width: mq.height * 0.3,
            ),
            Text(
              widget.user.email,
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
            SizedBox(
              width: mq.height * 0.03,
            ),
            TextFormField(
              initialValue: widget.user.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'e.g Kiran Giri',
                  labelText: 'Name',
                  prefix: const Icon(
                    Icons.person,
                    color: Colors.blue,
                  )),
            ),
            SizedBox(
              width: mq.height * 0.03,
            ),
            TextFormField(
              initialValue: widget.user.about,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'e.g Feeling happy',
                  labelText: 'About',
                  prefix: const Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                  )),
            ),
            SizedBox(
              width: mq.height * 0.03,
            ),
            ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: Size(mq.width * 0.5, mq.height * .06)),
                icon: const Icon(Icons.edit),
                label: const Text(
                  'UPDATE',
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        onPressed: () async {
          await APIs.auth.signOut();
          await GoogleSignIn().signOut();
        },
        label: const Text('Logout'),
        icon: const Icon(Icons.logout),
      ),
    );
  }
}
