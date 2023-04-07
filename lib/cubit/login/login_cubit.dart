import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth/auth_repository.dart';


part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;



  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.start());


  void emailChanged(String email) {
    emit(state.copyWith(email: email, status: LoginStatus.start));
  }


  void passwordChanged(String password) {
    emit(state.copyWith(password: password, status: LoginStatus.start));
  }


  void login() async {
    try{
      final String email = state.email.trim();
      final String password = state.password.trim();
      await _authRepository.login(
          email: email, password: password);
      emit(state.copyWith(status: LoginStatus.success));
    }
    catch (_){

    }
  }
}