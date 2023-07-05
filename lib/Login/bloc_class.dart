import 'package:bloc/bloc.dart';
import 'package:blocc/Login/login_event.dart';
import 'package:blocc/Login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(super.initialState);

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        await Future.delayed(const Duration(seconds: 2));

        if (event.username == 'admin' && event.password == 'password') {
          yield LoginSuccess();
        } else {
          yield LoginFailure(error: "Invalid username or password");
        }
      } catch (e) {
        yield LoginFailure(error: "Login failed");
      }
    }
  }
}
