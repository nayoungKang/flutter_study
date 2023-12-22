import 'package:flutter/material.dart';
import 'package:twitter_clone/settings/repos/dark_theme_repo.dart';

class DarkThemeConfigViewModel extends ChangeNotifier {
  final DarkThemeConfigRepository _repository;
  DarkThemeConfigViewModel(this._repository);

  //모델 일단 생략

  bool get isDark => _repository.isDark();

  void setDark(bool value) {
    _repository.setDark(value);
    notifyListeners();
  }
}
