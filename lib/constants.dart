import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:new_try_video/views/widgets/screens/add_video_screen.dart';
import 'package:new_try_video/views/widgets/screens/again_video_screen.dart';
import 'package:new_try_video/views/widgets/screens/video_screen.dart';

List pages = [
  VideoApp(),
  AddVideoScreen(),
];

// COLORS
const backgroundColor = Color.fromARGB(255, 13, 1, 8);
var buttonColor = Color.fromARGB(255, 89, 89, 100);
const borderColor = Colors.white;
 
 //firebase
 var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;