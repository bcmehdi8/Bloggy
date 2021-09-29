import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:travelv2/backend/auth_bloc/auth_event.dart';
import 'package:travelv2/backend/auth_bloc/auth_repo.dart';
import 'package:travelv2/backend/auth_bloc/auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;
  late AuthenticationBloc authenticationBloc;

  AuthenticationBloc(AuthenticationState initialState, this.userRepository)
      : super(initialState);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is appStarted) {
      print("appStarted");
      final bool hasToken = await userRepository.hasToken();
      if (hasToken == true) {
        print("hasToken == true");
        yield AuthenticationAuthenticated();
      } else {
        print("hasToken == false");
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken(event.token);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
