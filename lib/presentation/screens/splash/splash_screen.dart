import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'app_name'.tr(),
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
