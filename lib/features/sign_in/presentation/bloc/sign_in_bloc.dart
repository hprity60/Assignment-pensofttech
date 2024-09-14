// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:assignment_app/features/sign_in/domain/repositories/sign_in_rpository.dart';

import '../../data/models/sign_in_request_model.dart';
import '../../data/models/sign_in_response_model.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInRepository signInRepository;
  String errorMessage = "";
  late SignInResponseModel model;
  SignInBloc({required this.signInRepository}) : super(SignInInitial()) {
    on<LoggedInEvent>((event, emit) async {
      emit(SignInLoadingState());
      try {
        model = await signInRepository.signIn(
            signInRequestModel: event.signInRequestModel);
        if (model.success == true) {
          emit(SignInSuccessState(signInResponseModel: model));
        } else {
          emit(SignInFailureState(
            errorMessage: model.error,
          ));
        }
      } on DioException {
        errorMessage = model.error;
        emit(SignInFailureState(
          errorMessage: model.error,
        ));
      } catch (e) {
        // DebugPrint.print(e.toString());
        emit(SignInFailureState(
          errorMessage: (e.toString()),
        ));
      }
    });
  }
}
