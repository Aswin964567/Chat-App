import 'package:chat_app/auth/signin.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(){
  _initializeFirebase();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:SignIn()
  ));
}

_initializeFirebase()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}