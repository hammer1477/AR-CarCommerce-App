import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth/auth_repository.dart';


part 'signup_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepository _authRepository;



  SignUpCubit({required AuthRepository authRepository})
  : _authRepository = authRepository,
  super(SignUpState.start());


  void emailChanged(String email) {
    emit(state.copyWith(email: email, status: SignUpStatus.start));
  }


  void passwordChanged(String password) {
    emit(state.copyWith(password: password, status: SignUpStatus.start));
  }


  void signup() async {
    try{
      print('try cubit');
      print(state.email);
      print(state.password);
      final String email = state.email.trim();
      final String password = state.password.trim();
      await _authRepository.signUp(
          email: email, password: password);
      print('tab eh');
      emit(state.copyWith(status: SignUpStatus.success));
    }
   catch (_){

   }
  }
}