part of 'login_cubit.dart';

enum LoginStatus { start, submitting, success, error}


class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final auth.User? user;

  const LoginState({
    required this.email,
    required this.password,
    required this.status,
    this.user
});


  factory LoginState.start() {
    return LoginState(email: '', password: '', status: LoginStatus.start);
  }


  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status
  }){
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, status];
}
