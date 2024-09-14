part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class LoggedInEvent extends SignInEvent {
  final SignInRequestModel signInRequestModel;

  const LoggedInEvent({required this.signInRequestModel});

  @override
  List<Object> get props => [signInRequestModel];
}
