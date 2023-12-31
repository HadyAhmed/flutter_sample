import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/config/router/app_router.dart';
import 'package:flutter_sample/presentation/screens/app_provider.dart';
import 'package:flutter_sample/presentation/screens/auth/authentication_provider.dart';
import 'package:flutter_sample/presentation/screens/home/home_provider.dart';
import 'package:flutter_sample/presentation/screens/posts/add/add_post_provider.dart';
import 'package:flutter_sample/presentation/screens/profile/profile_provider.dart';
import 'package:flutter_sample/presentation/screens/splash/splash_provider.dart';
import 'package:flutter_sample/utils/extensions/layout_ext.dart';
import 'package:flutter_sample/utils/resources/lang_res.dart';
import 'package:provider/provider.dart';

class SampleApp extends StatefulWidget {
  const SampleApp({super.key});

  @override
  State<SampleApp> createState() => _SampleAppState();
}

class _SampleAppState extends State<SampleApp> {
  @override
  Widget build(BuildContext context) {
    final isAppInArabic = context.isRTL();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => AddPostProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: Consumer<AppProvider>(
        builder: (context, provider, child) {
          return MaterialApp.router(
            title: 'Sample App',
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            routerConfig: AppRouter.router,
            theme: Provider.of<AppProvider>(context).appTheme.copyWith(
                  textTheme: Provider.of<AppProvider>(context)
                      .appTheme
                      .textTheme
                      .apply(
                        fontFamily: isAppInArabic
                            ? LanguageResource.kArabicFont
                            : LanguageResource.kEnglishFont,
                      ),
                ),
          );
        },
      ),
    );
  }
}
