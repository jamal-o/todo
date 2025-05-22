// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/src/feat/auth/data/auth_repositoryImpl.dart';
import 'package:todo/src/feat/auth/presentation/sign_in_page.dart';

final signInPageProvider =
    NotifierProvider<SignInPageNotifier, SignInPageState>(
        SignInPageNotifier.new);

class SignInPageNotifier extends Notifier<SignInPageState> {
  @override
  build() {
    return SignInPageState(
      email: null,
      password: null,
      isloading: false,
    );
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  Future<UIResponse?> login() async {
    debugPrint("login");
    state = state.copyWith(isloading: true);
    await ref.read(authRepositoryProvider).login(state.email!, state.password!);
    state = state.copyWith(isloading: false);
    return UIResponse(true, "Network error");
  }
}

@immutable
class SignInPageState {
  final String? email;
  final String? password;
  final bool isloading;

  const SignInPageState({
    required this.email,
    required this.password,
    required this.isloading,
  });

  SignInPageState copyWith({
    String? email,
    String? password,
    bool? isloading,
  }) {
    return SignInPageState(
      email: email ?? this.email,
      password: password ?? this.password,
      isloading: isloading ?? this.isloading,
    );
  }

  @override
  String toString() =>
      'SignInPageState(email: $email, password: $password, isloading: $isloading)';
}
