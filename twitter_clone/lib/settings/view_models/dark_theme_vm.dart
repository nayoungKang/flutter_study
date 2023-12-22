import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/settings/models/dark_theme_model.dart';
import 'package:twitter_clone/settings/repos/dark_theme_repo.dart';

class DarkThemeConfigViewModel extends Notifier<DarkThemeModel> {
  final DarkThemeConfigRepository _repository;
  DarkThemeConfigViewModel(this._repository);

  //모델 일단 생략

  bool get isDark => _repository.isDark();

  void setDark(bool value) {
    _repository.setDark(value);
    state = DarkThemeModel(
      isDark: value,
    );
  }

  @override
  DarkThemeModel build() {
    return DarkThemeModel(
      isDark: _repository.isDark(),
    );
  }
}

final DarkThemeProvider =
    NotifierProvider<DarkThemeConfigViewModel, DarkThemeModel>(
  () => throw UnimplementedError(),
);
