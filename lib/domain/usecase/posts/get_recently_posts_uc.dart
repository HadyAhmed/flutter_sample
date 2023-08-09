import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample/data/repository/post_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetRecentlyPostsUseCase {
  final PostRepository _repository;

  GetRecentlyPostsUseCase(this._repository);

  Query<Map<String, dynamic>> run() {
    return _repository.getRecentlyPosts();
  }
}
