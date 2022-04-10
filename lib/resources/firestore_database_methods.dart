import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirestoreDatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // adding payinfo to Firebase Firestore Database
  Future<String> setPay({
    required String content,
    required String amount,
    required String uid,
  }) async {
    String res = 'Some error occured';
    try {
      await _firestore.collection('pay').doc().set({
        'content': content,
        'amount': amount,
        'uid': uid,
      });
      res = 'Success!';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
