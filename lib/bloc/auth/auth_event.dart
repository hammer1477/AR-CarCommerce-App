part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthUserChanged extends AuthEvent {
  final auth.User? authUser;

  const AuthUserChanged({
    this.authUser
});

  @override
  List<Object?> get props => [authUser];
}


