import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_event.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/login_bloc/login_state.dart';
import 'package:travelv2/backend/login_bloc/login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  late AuthenticationBloc authenticationBloc;

  LoginBloc(LoginState loginInitial, this.authRepository) : super(loginInitial);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    //Login Event
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      print("Login event is started");
      try {
        final token = await authRepository.login(
          event.email,
          event.password,
        );
        if (token['message'] == "DONE") {
          print("Login DONE");
          yield LoginSuccess();
        } else if (token['message'] == "EMAIL_ISSUE") {
          print("Unknown Email Detected");
          yield LoginUnknownEmail();
        }else if (token['message'] == "PWD_ISSUE") {
          print("Wrong Password Detected");
          yield LoginWrongPassword();
        }
        authenticationBloc.add(LoggedIn(token: token));
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }

    //Register Event
    if (event is RegisterButtonPressed) {
      yield LoginLoading();
      print("Register event is started");

      try {
        final token = await authRepository.Singup(
          event.username,
          event.email,
          event.password,
        );

        if (token['message'] == "NEW") {
          print("New Email");
          yield RegisterSuccess();
        } else {
          print("Old Email");
          yield AlreadyUsedEmail();
        }

        authenticationBloc.add(LoggedIn(token: token));
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
