import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_sample/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@injectable
mixin PostsDataSource {
  Future<DocumentReference<Map<String, dynamic>>> addPost(PostDomain post);

  Query<Map<String, dynamic>> getRecentlyPosts({String? uid});

  Future<String> getFileDownloadURL(String fileRef);

  Future<TaskSnapshot> uploadImage(
    String fileRef,
    String imageName,
    File imageFile,
  );
}
