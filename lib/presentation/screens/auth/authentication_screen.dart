import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/config/router/destinations.dart';
import 'package:flutter_sample/presentation/screens/auth/authentication_provider.dart';
import 'package:flutter_sample/presentation/widgets/custom_text_field.dart';
import 'package:flutter_sample/presentation/widgets/general_loading.dart';
import 'package:flutter_sample/presentation/widgets/select_app_language.dart';
import 'package:flutter_sample/utils/extensions/size_utils.dart';
import 'package:flutter_sample/utils/extensions/snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthenticationProvider>(
          builder: (conContext, provider, conChild) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Center(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Hero(
                                tag: 'title',
                                child: Text(
                                  'app_name'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 32),
                              CustomTextField(
                                controller: _username,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                label: 'authentication_screen.email'.tr(),
                                hint: 'email@domain.com',
                              ),
                              const SizedBox(height: 16),
                              CustomTextField(
                                controller: _password,
                                label: 'authentication_screen.password'.tr(),
                                hint:
                                    'authentication_screen.password_hint'.tr(),
                                obscureText: true,
                              ),
                              const SizedBox(height: 32),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.getWidthPercentage(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _login(provider, _username.text,
                                            _password.text);
                                      },
                                      child: Text(
                                          'authentication_screen.login'.tr()),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.pushNamed(RouterDestination
                                            .forgotPasswordScreen);
                                      },
                                      child: Text(
                                          'authentication_screen.forget_password'
                                              .tr()),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                width: context.getWidthPercentage(80),
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.pushNamed(
                                        RouterDestination.createAccountScreen);
                                  },
                                  child: Text(
                                      'authentication_screen.new_account'.tr()),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text(
                                    'authentication_screen.change_language'
                                        .tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 16),
                                  const Flexible(child: SelectAppLanguage()),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(Icons.language),
                      label: Text(
                        'authentication_screen.change_language'.tr(),
                      ),
                    )
                  ],
                ),
                if (provider.isGeneralLoading) const GeneralLoadingWidget()
              ],
            );
          },
        ),
      ),
    );
  }

  void _login(
    AuthenticationProvider provider,
    String username,
    String password,
  ) async {
    // TODO handle the input validation errors later
    if (username.isEmpty || password.isEmpty) {
      context.showSnackBar(message: 'Make sure to insert valid data');
      return;
    }
    try {
      provider.isGeneralLoading = true;
      await provider.loginWithCredentials(username, password).then((value) {
        context.goNamed(RouterDestination.homeScreen);
      });
    } catch (e) {
      context.showSnackBar(message: e.toString());
    } finally {
      provider.isGeneralLoading = false;
    }
  }
}
