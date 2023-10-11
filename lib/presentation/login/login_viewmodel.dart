import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_flutter_template/app/functions.dart';
import 'package:mobile_flutter_template/data/repository/repository_impl.dart';
import 'package:mobile_flutter_template/data/request/request.dart';
import 'package:mobile_flutter_template/domain/model/model.dart';
import 'package:mobile_flutter_template/domain/repository/repository.dart';
import 'package:mobile_flutter_template/domain/state/login_state.dart';

final loginProvider = StateNotifierProvider<LoginViewModel, LoginState>((ref) {
  return LoginViewModel(ref);
});

final passwordControllerProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});

final userNameControllerProvider = StateProvider.autoDispose<String>((ref) {
  return '';
});
final isFormValid = StateProvider.autoDispose<bool>((ref) {
  return ref.watch(passwordControllerProvider).isNotEmpty &&
      ref.watch(userNameControllerProvider).isNotEmpty;
});

class LoginViewModel extends StateNotifier<LoginState> {
  LoginViewModel(this._ref) : super(const LoginState.initial(''));

  final Ref _ref;
  late final Repository _repository = _ref.read(repositoryProvider);

  Future<void> login() async {
    state = const LoginState.loading();
    DeviceInfo deviceInfo = await getDeviceDetails();
    print('username ${_ref.read(userNameControllerProvider)}');
    final response = await _repository.login(LoginRequest(
        _ref.read(userNameControllerProvider),
        _ref.read(passwordControllerProvider),
        deviceInfo.identifier,
        deviceInfo.name));
    if (mounted) {
      state = response;
    }
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
