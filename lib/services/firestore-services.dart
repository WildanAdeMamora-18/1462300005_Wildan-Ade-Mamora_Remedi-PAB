import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {

  final FirebaseFirestore firestore =
      FirebaseFirestore.instance;

  final FirebaseAuth auth =
      FirebaseAuth.instance;

  Future<void> addFavorite({
    required int articleId,
    required String title,
    required String imageUrl,
  }) async {

    await firestore.collection('favorites').add({
      'uid': auth.currentUser!.uid,
      'articleId': articleId,
      'title': title,
      'imageUrl': imageUrl,
      'createdAt': Timestamp.now(),
    });
  }
}