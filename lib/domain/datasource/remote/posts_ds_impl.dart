import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_sample/data/datasource/source/remote/posts_ds.dart';
import 'package:flutter_sample/data/mapper/network_errors.dart';
import 'package:flutter_sample/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostsDataSource)
class PostsDataSourceImpl with PostsDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  PostsDataSourceImpl(this._firestore, this._auth, this._storage);

  @override
  Future<DocumentReference<Map<String, dynamic>>> addPost(
    PostDomain post,
  ) async {
    try {
      if (post.imagePath != null) {
        final imageFile = File(post.imagePath!);
        final imageName = Timestamp.now().millisecondsSinceEpoch.toString();
        final fileRef = "Posts/${_auth.currentUser?.uid}";

        return await uploadImage(fileRef, imageName, imageFile).then(
            (value) async => await getFileDownloadURL('$fileRef/$imageName')
                .then(
                    (value) async => await _firestore.collection('Posts').add({
                          'createdBy': _auth.currentUser?.uid,
                          'text': post.text,
                          'imagePath': value,
                          'createdAt': post.createdAt
                        })));
      } else {
        return await _firestore.collection('Posts').add({
          'createdBy': _auth.currentUser?.uid,
          'text': post.text,
          'createdAt': post.createdAt
        });
      }
    } on Exception catch (e) {
      return Future.error(handleNetworkErrors(e));
    }
  }

  Future<String> getFileDownloadURL(String fileRef) async {
    return await _storage.ref(fileRef).getDownloadURL();
  }

  Future<TaskSnapshot> uploadImage(
    String fileRef,
    String imageName,
    File imageFile,
  ) async {
    return await _storage.ref(fileRef).child(imageName).putFile(imageFile);
  }
}
