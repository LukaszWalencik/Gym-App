import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(
          LoginState(login: null, password: null),
        );
  Future<void> passwordEnter(String passwordvalue) async {
    print(passwordvalue);
  }

  Future<void> emailEnter(String emailValue) async {
    print(emailValue);
  }
}
