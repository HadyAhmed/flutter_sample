import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/domain/entities/supported_languages.dart';
import 'package:flutter_sample/utils/extensions/layout_ext.dart';
import 'package:flutter_sample/utils/resources/lang_res.dart';

class SelectAppLanguage extends StatefulWidget {
  const SelectAppLanguage({Key? key}) : super(key: key);

  @override
  State<SelectAppLanguage> createState() => _SelectAppLanguageState();
}

class _SelectAppLanguageState extends State<SelectAppLanguage> {
  late final _supportedLanguages = [
    SupportedLanguage('English', Language.en, !context.isRTL()),
    SupportedLanguage('العربية', Language.ar, context.isRTL()),
  ];

  late SupportedLanguage _selectedLanguage =
      _supportedLanguages.singleWhere((element) => element.currentLanguage);

  set selectedLanguage(SupportedLanguage value) {
    setState(() {
      _selectedLanguage = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _supportedLanguages.length,
      itemBuilder: (context, index) {
        final currentLang = _supportedLanguages[index];
        return RadioListTile<SupportedLanguage>(
          value: currentLang,
          groupValue: _selectedLanguage,
          onChanged: (value) {
            selectedLanguage = value!;
            context.setLocale(Locale(value.code.name));
          },
          title: Text(
            currentLang.name,
            style: TextStyle(
              fontFamily: currentLang.code == Language.ar
                  ? LanguageResource.kArabicFont
                  : LanguageResource.kEnglishFont,
            ),
          ),
        );
      },
    );
  }
}
