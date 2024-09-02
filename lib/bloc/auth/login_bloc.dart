import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_auth/Respositery/login_repo.dart';
import 'package:jwt_auth/bloc/auth/login_event.dart';
import 'package:jwt_auth/bloc/auth/login_state.dart';
import 'package:jwt_auth/model/loginres_model.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginReqEvent>(_loginRequest);
  }

  void _loginRequest(LoginReqEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    // loading state emitted

    try {
      LoginModel loginResponse = await LoginRepo().login(
          username: event.loginreqModel?.username ?? '',
          password: event.loginreqModel?.password ?? '');

      // login response

      emit(LoginLoaded(loginModel: loginResponse));
      // loaded state emitted
    } catch (e) {
      emit(LoginError(errorMessage: e.toString()));
    }
  }
}
