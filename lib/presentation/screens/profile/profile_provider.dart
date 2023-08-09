import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample/di/dependency_injectable.dart';
import 'package:flutter_sample/domain/usecase/posts/get_recently_posts_uc.dart';
import 'package:flutter_sample/domain/usecase/user/get_account_data_uc.dart';
import 'package:flutter_sample/domain/usecase/user/get_user_uc.dart';
import 'package:flutter_sample/domain/usecase/user/update_name_uc.dart';

class ProfileProvider with ChangeNotifier {
  final _getAccountDataUseCase = locator<GetAccountDataUseCase>();
  final _getUserData = locator<GetUserUseCase>();
  final _getPostsUseCase = locator<GetRecentlyPostsUseCase>();
  final _updateNameUseCase = locator<UpdateNameUseCase>();

  bool _isGeneralLoading = false;

  bool get isGeneralLoading => _isGeneralLoading;

  set isGeneralLoading(bool value) {
    _isGeneralLoading = value;
    notifyListeners();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getAccountData(String? uid) {
    return uid != null ? _getUserData.run(uid) : _getAccountDataUseCase.run();
  }

  Query<Map<String, dynamic>> getRecentlyPosts({String? uid}) {
    return _getPostsUseCase.run(uid: uid);
  }

  Future<void> updateName(String name) {
    return _updateNameUseCase.run(name);
  }
}
