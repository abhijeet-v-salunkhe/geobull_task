import 'dart:developer';

import 'package:flutter/material.dart';

import 'my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    log("Firebase configure successfully");
  } catch (e) {
    log("Exception during firebase config: $e");
  }
  runApp(const MyApp());
}
