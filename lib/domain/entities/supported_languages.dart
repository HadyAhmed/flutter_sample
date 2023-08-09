class SupportedLanguage {
  final String name;
  final Language code;
  final bool currentLanguage;

  SupportedLanguage(this.name, this.code, this.currentLanguage);
}

enum Language { en, ar }
