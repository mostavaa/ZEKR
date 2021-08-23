import 'package:flutter/material.dart';
import './languages.dart';

class LanguageEn extends Languages {
  static Languages of(BuildContext context) {
    return Localizations.of<Languages>(context, Languages);
  }

  @override
  // TODO: implement appName
  String get appName => "ZEKR";

  @override
  // TODO: implement labelInfo
  String get labelInfo => "Welcome";

  @override
  // TODO: implement labelSelectLanguage
  String get labelSelectLanguage => "Select Language";

  @override
  // TODO: implement labelWelcome
  String get labelWelcome => "Welcome";
}
