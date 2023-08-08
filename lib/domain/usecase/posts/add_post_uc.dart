import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample/data/repository/post_repo.dart';
import 'package:flutter_sample/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddPostUseCase {
  final PostRepository _repository;

  AddPostUseCase(this._repository);

  Future<DocumentReference<Map<String, dynamic>>> run(PostDomain post) {
    return _repository.addPost(post);
  }
}
