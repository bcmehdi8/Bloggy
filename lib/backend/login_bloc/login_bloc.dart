import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_event.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/login_bloc/login_state.dart';
import 'package:travelv2/backend/login_bloc/login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
 // final AuthenticationBloc authenticationBloc;

  LoginBloc({
    required LoginInitial loginInitial,
    required this.userRepository,
  })  : super(loginInitial);


  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.login(
          event.email,
          event.password,
        );
      //  authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}