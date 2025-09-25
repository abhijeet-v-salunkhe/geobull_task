import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseSetUp {
  static FirebaseFirestore? db;

  FirebaseSetUp._internal() {
    db = FirebaseFirestore.instance;
  }

  factory FirebaseSetUp() {
    return FirebaseSetUp._internal();
  }

  static void ensureFirebaseSetUp() {
    if (db == null) {
      FirebaseSetUp._internal();
    }
  }

  Future<dynamic> postData({
    required Map<String, dynamic> data,
    required String collectionName,
  }) async {
    try {
      ensureFirebaseSetUp();

      DocumentReference docRef = await db!.collection(collectionName).add(data);

      return docRef.id;
    } catch (e) {
      log("Exception in PostData : $e");
      return null;
    }
  }
}
