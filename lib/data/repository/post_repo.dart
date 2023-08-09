import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@injectable
mixin PostRepository {
  Future<DocumentReference<Map<String, dynamic>>> addPost(PostDomain post);

  Query<Map<String, dynamic>> getRecentlyPosts();
}
