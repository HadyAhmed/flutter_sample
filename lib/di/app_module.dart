import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_sample/service/firebase_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {
  @preResolve
  Future<FirebaseService> get fireService async => await FirebaseService.init();

  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();

  @injectable
  FirebaseFirestore get store => FirebaseFirestore.instance;

  @injectable
  FirebaseStorage get storage => FirebaseStorage.instance;

  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance
    ..setSettings(
      forceRecaptchaFlow: false,
    );

  @injectable
  FirebaseAnalytics get analytics =>
      FirebaseAnalytics.instance..setUserId(id: auth.currentUser?.uid);

  @injectable
  FirebasePerformance get performance => FirebasePerformance.instance;

  @injectable
  FirebaseCrashlytics get crashlytics =>
      FirebaseCrashlytics.instance..sendUnsentReports();
}
