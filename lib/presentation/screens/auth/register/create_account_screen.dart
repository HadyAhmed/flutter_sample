import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/config/router/destinations.dart';
import 'package:flutter_sample/presentation/screens/auth/authentication_provider.dart';
import 'package:flutter_sample/presentation/widgets/custom_text_field.dart';
import 'package:flutter_sample/presentation/widgets/general_loading.dart';
import 'package:flutter_sample/utils/extensions/snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('authentication_screen.register_account'.tr()),
      ),
      body: Center(
        child: Consumer<AuthenticationProvider>(
          builder: (conContext, provider, conChild) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'title',
                      child: Text(
                        'authentication_screen.new_account'.tr(),
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
                      hint: 'authentication_screen.password_hint'.tr(),
                      textInputAction: TextInputAction.next,
                      obscureText: true,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: _confirmPassword,
                      label: 'authentication_screen.confirm_password'.tr(),
                      hint: 'authentication_screen.password_hint'.tr(),
                      obscureText: true,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        _createAccount(
                          provider,
                          _username.text,
                          _password.text,
                          _confirmPassword.text,
                        );
                      },
                      child:
                          Text('authentication_screen.register_account'.tr()),
                    ),
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

  void _createAccount(
    AuthenticationProvider provider,
    String username,
    String password,
    String confirmPassword,
  ) async {
    // TODO handle the input validation errors later
    if (username.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        password != confirmPassword) {
      context.showSnackBar(message: 'Make sure to insert valid data');
      return;
    }

    try {
      provider.isGeneralLoading = true;
      await provider.createNewAccount(username, password).then((value) {
        context.goNamed(RouterDestination.homeScreen);
      });
    } catch (e) {
      context.showSnackBar(message: e.toString());
    } finally {
      provider.isGeneralLoading = false;
    }
  }
}
