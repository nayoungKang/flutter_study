import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nomad_flutter_2nd_final/repos/authentication_repo.dart';
import 'package:nomad_flutter_2nd_final/views/main_nav_screen.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthenticationRepository _repository;

  @override
  FutureOr<void> build() {
    _repository = ref.read(authRepo);
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    state = const AsyncValue.loading();
    await AsyncValue.guard(
      () async => await _repository.signIn(email, password),
    ).then((state) {
      if (state.hasError) {
        //showFirebaseErrorSnack(context, state.error);
      } else if (context.mounted) {
        //error //https://seorenn.github.io/note/flutter-buildcontext-in-async-func.html
        GoRouter.of(context).go('${MainNavScreen.url}moods');
      }
    });
  }
}

final loginProvider = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
