import 'package:equatable/equatable.dart';
import 'package:jwt_auth/model/loginreq_model.dart';

abstract class LoginEvent extends Equatable {}

class LoginReqEvent extends LoginEvent {
  final LoginreqModel? loginreqModel;
  LoginReqEvent({this.loginreqModel});
  // final String? username;
  // final String? password;
  // LoginReqEvent({this.password, this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [loginreqModel];
}
