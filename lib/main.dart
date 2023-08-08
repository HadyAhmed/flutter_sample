import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/di/dependency_injectable.dart';
import 'package:flutter_sample/presentation/screens/app.dart';

void main() async {
  await _init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'res/strings',
      fallbackLocale: const Locale('en'),
      child: const SampleApp(),
    ),
  );
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await configureDependencies();
}
