import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradproj6/repository/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import '../../Model/user.dart';
import '../../repository/user/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  StreamSubscription<auth.User?>? _authUserSubscription;


  AuthBloc({
    required AuthRepository authRepository,
}) : _authRepository = authRepository,
    super(AuthState.unknown()) {
    on<AuthUserChanged>(_onAuthUserChanged);
    _authUserSubscription = authRepository.user.listen((event) {
      add(AuthUserChanged(authUser: event!));
    });

  }

  void _onAuthUserChanged(
      AuthUserChanged event,
      Emitter<AuthState> emit
      ) {
    event.authUser != null ?
        emit(AuthState.authenticated(authUser: event.authUser!))
        : emit(AuthState.unauthenticated());
  }


  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    return super.close();
  }

}