import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/presentation/screens/auth/authentication_provider.dart';
import 'package:flutter_sample/presentation/widgets/custom_text_field.dart';
import 'package:flutter_sample/presentation/widgets/general_loading.dart';
import 'package:flutter_sample/utils/extensions/snackbar.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('authentication_screen.forget_password'.tr()),
      ),
      body: Center(
        child: Consumer<AuthenticationProvider>(
          builder: (conContext, provider, conChild) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'title',
                      child: Text(
                        'authentication_screen.forget_password'.tr(),
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
                      label: 'authentication_screen.email'.tr(),
                      hint: 'email@domain.com',
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {
                        _resetPassword(
                          provider,
                          _username.text,
                        );
                      },
                      child: Text(
                          'authentication_screen.send_reset_password_link'
                              .tr()),
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

  void _resetPassword(
    AuthenticationProvider provider,
    String username,
  ) async {
    // TODO handle the input validation errors later
    if (username.isEmpty) {
      context.showSnackBar(message: 'Make sure to insert valid data');
      return;
    }

    try {
      provider.isGeneralLoading = true;
      await provider.resetPassword(username).then((value) {
        context.showSnackBar(
            message: 'We sent you a reset password link on your email');
        context.pop();
      });
    } catch (e) {
      context.showSnackBar(message: e.toString());
    } finally {
      provider.isGeneralLoading = false;
    }
  }
}
