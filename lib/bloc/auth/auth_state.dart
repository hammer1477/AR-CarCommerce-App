part of 'auth_bloc.dart';

enum AuthStatus { unknown, authenticated, unauthenticated }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? authUser;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.authUser,
});

  const AuthState.unknown() : this._();

  const AuthState.authenticated({
    required auth.User authUser,
}) : this._(
    status: AuthStatus.authenticated,
    authUser: authUser,
  );

  const AuthState.unauthenticated() : this._(
    status: AuthStatus.unauthenticated,
  );

  @override
  List<Object?> get props => [status, authUser];
}
