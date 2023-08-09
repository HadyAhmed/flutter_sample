import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_sample/data/datasource/source/remote/posts_ds.dart';
import 'package:flutter_sample/data/repository/post_repo.dart';
import 'package:flutter_sample/domain/entities/post.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PostRepository)
class PostsRepositoryImpl with PostRepository {
  final PostsDataSource _dataSource;

  PostsRepositoryImpl(this._dataSource);

  @override
  Future<DocumentReference<Map<String, dynamic>>> addPost(PostDomain post) {
    return _dataSource.addPost(post);
  }

  @override
  Query<Map<String, dynamic>> getRecentlyPosts() {
    return _dataSource.getRecentlyPosts();
  }
}
