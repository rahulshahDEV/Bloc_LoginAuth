import 'package:equatable/equatable.dart';
import 'package:jwt_auth/model/loginres_model.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginLoaded extends LoginState {
  final LoginModel? loginModel;
  LoginLoaded({this.loginModel});

  @override
  // TODO: implement props
  List<Object?> get props => [loginModel];
}

class LoginError extends LoginState {
  final String? errorMessage;
  LoginError({this.errorMessage});
  @override
  // TODO: implement props
  List<Object?> get props => [errorMessage];
}
