import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_event.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/login_bloc/login_state.dart';
import 'package:travelv2/backend/login_bloc/login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  late AuthenticationBloc authenticationBloc;

  LoginBloc(LoginState loginInitial, this.userRepository) : super(loginInitial);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      print("Login event is started");
      try {
        final token = await userRepository.login(
          event.email,
          event.password,
        );
        print("Login DONE");
        yield LoginSuccess();
        authenticationBloc.add(LoggedIn(token: token));
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
    if (event is RegisterButtonPressed) {
      yield LoginLoading();
   print("Register event is started");
      try {
        final token = await userRepository.Singup(
          event.username,
          event.email,
          event.password,
        );
        print("Register DONE");
        yield RegisterSuccess();
        authenticationBloc.add(LoggedIn(token: token));
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
