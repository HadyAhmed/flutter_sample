import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart' as loc;
import 'package:flutter/material.dart';
import 'package:flutter_sample/config/router/destinations.dart';
import 'package:flutter_sample/presentation/screens/splash/splash_provider.dart';
import 'package:flutter_sample/utils/extensions/layout_ext.dart';
import 'package:flutter_sample/utils/extensions/snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward()
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _checkStatus();
            }
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const colorizeColors = [
      Colors.purple,
      Colors.blue,
      Colors.yellow,
      Colors.red,
    ];
    return Scaffold(
      body: Center(
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            ColorizeAnimatedText(
              'app_name'.tr(),
              colors: context.isRTL()
                  ? colorizeColors.reversed.toList()
                  : colorizeColors,
              speed: const Duration(milliseconds: 400),
              textStyle: Theme.of(context).textTheme.headlineMedium!,
              textDirection:
                  context.isRTL() ? TextDirection.rtl : TextDirection.ltr,
            )
          ],
        ),
      ),
    );
  }

  void _checkStatus() async {
    final authProvider = Provider.of<SplashProvider>(context, listen: false);
    try {
      final isLoggedIn = await authProvider.isLoggedIn();
      if (mounted) {
        context.goNamed(
          isLoggedIn != null
              ? RouterDestination.homeScreen
              : RouterDestination.authenticationScreen,
        );
      }
    } catch (e) {
      context.showSnackBar(
        message: e.toString(),
        showLongDuration: true,
      );
    }
  }
}
