part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitial extends SignInState {}

class SignInSuccessState extends SignInState {
  final SignInResponseModel signInResponseModel;

  const SignInSuccessState({required this.signInResponseModel});

  @override
  List<Object> get props => [signInResponseModel];
}

class SignInLoadingState extends SignInState {
  @override
  List<Object> get props => [];
}

class SignInFailureState extends SignInState {
  final String errorMessage;

  const SignInFailureState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
