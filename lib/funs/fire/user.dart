import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/widgets.dart';

class UserFire {
  static CollectionReference get userCollection => FirebaseFirestore.instance.collection("user");

  Future<void> create(String uid, Map<String, dynamic> data) async {
    await userCollection.doc(uid).set(data);
  }

  Future<void> update(String uid, Map<String, dynamic> data) async {
    await userCollection.doc(uid).update(data);
  }

  Future<void> delete(String uid) async {
    await userCollection.doc(uid).delete();
  }

  // static Future<Map<String, dynamic>> read(String uid) async {
  //   final doc = await userCollection.doc(uid).get();
  //   return doc.data();
  // }

  // static Future<List<Map<String, dynamic>>> readAll() async {
  //   final query = await Fire.userCollection.get();
  //   return query.docs.map((doc) => doc.data()).toList();
  // }
}
