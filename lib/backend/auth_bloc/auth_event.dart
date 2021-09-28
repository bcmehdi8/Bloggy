import 'package:equatable/equatable.dart';

class AuthenticationEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class appStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  String token;
  LoggedIn({required  this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn {$token}';
}

class LoggedOut extends AuthenticationEvent {}
