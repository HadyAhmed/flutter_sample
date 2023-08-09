import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_sample/di/dependency_injectable.dart';
import 'package:flutter_sample/domain/entities/post.dart';
import 'package:flutter_sample/domain/usecase/posts/add_post_uc.dart';

class AddPostProvider with ChangeNotifier {
  bool _isGeneralLoading = false;

  bool get isGeneralLoading => _isGeneralLoading;

  set isGeneralLoading(bool value) {
    _isGeneralLoading = value;
    notifyListeners();
  }

  final _addPostUC = locator<AddPostUseCase>();

  Future<DocumentReference<Map<String, dynamic>>> addPost(PostDomain post) {
    return _addPostUC.run(post);
  }
}
