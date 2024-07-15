import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/api/apis.dart';
import 'package:chat_app/main.dart';
import 'package:chat_app/models/chat_user_model.dart';
import 'package:chat_app/screens/auth/login_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../helper/dialogs.dart';

class ProfileScreenPage extends StatefulWidget {
  final ChatUser user;
  const ProfileScreenPage({super.key, required this.user});

  @override
  State<ProfileScreenPage> createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusScope.of(context).unfocus(),
      child: Scaffold(
        //app bar//
        appBar: AppBar(
          title: const Text('Profile Screen'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.height * 0.05),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    width: mq.width,
                    height: mq.height * 0.03,
                  ),
                  Stack(
                    children: [
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: MaterialButton(
                          onPressed: () {},
                          elevation: 1,
                          color: Colors.white,
                          shape: const CircleBorder(),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
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
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.redAccent,
          onPressed: () async {
            // for showing progress bar//
            Dialogs.showProgressBar(context);
      
            //sign out from app//
            await APIs.auth.signOut().then((value) async {
              await GoogleSignIn().signOut().then((value) {
                //for removing progress bar//
                Navigator.pop(context);
      
                // for preventing to going back to home screen after coming to login screen//
                Navigator.pop(context);
      
                // replacing home screen to login screen//
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()));
              });
            });
          },
          label: const Text('Logout'),
          icon: const Icon(Icons.logout),
        ),
      ),
    );
  }
}
