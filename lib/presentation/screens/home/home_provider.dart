import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample/di/dependency_injectable.dart';
import 'package:flutter_sample/domain/usecase/posts/get_recently_posts_uc.dart';
import 'package:flutter_sample/domain/usecase/user/get_user_uc.dart';

class HomeProvider with ChangeNotifier {
  final _getPostsUseCase = locator<GetRecentlyPostsUseCase>();
  final _getUserData = locator<GetUserUseCase>();

  Query<Map<String, dynamic>> getRecentlyPosts() {
    return _getPostsUseCase.run();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(uid) {
    return _getUserData.run(uid);
  }
}
