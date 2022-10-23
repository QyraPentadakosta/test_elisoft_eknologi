part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailed extends LoginState {
  final String message;

  const LoginFailed(this.message);

  @override
  List<Object> get props => [message];
}

class LoginValidator extends LoginState {
  final bool validate;

  const LoginValidator(this.validate);

  @override
  List<Object> get props => [validate];
}
