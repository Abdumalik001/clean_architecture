import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/src/domain/models/common/domain_result.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/repositories/auth_repository.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository _repository;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterBloc(
    this._repository,
  ) : super(const RegisterState()) {
    on<Register>(_register);
  }

  Future<void> _register(Register event, Emitter emitter) {
    return emitter.forEach(
      _repository.register(usernameController.text, passwordController.text),
      onData: (data) {
        if (data is DomainLoading) {
          return state.copyWith(registerStatus: RegisterStatus.loading);
        }
        if (data is DomainSuccess) {
          return state.copyWith(registerStatus: RegisterStatus.success);
        }
        if (data is DomainFail) {
          return state.copyWith(registerStatus: RegisterStatus.fail);
        }
        return state;
      },
    );
  }
  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
