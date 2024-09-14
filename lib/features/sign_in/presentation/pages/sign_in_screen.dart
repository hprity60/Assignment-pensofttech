import 'package:assignment_app/core/network/dio_client.dart';
import 'package:assignment_app/core/values/app_colors.dart';
import 'package:assignment_app/core/values/text_styles.dart';
import 'package:assignment_app/features/home/presentation/pages/home_screen.dart';
import 'package:assignment_app/features/sign_in/data/datasources/sign_in_remote_data_source_impl.dart';
import 'package:assignment_app/features/sign_in/data/models/sign_in_request_model.dart';
import 'package:assignment_app/features/sign_in/data/repositories/sign_in_repository_impl.dart';
import 'package:assignment_app/features/sign_in/presentation/bloc/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/values/form_validator.dart';
import '../../../../core/values/my_snackbar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custome_button.dart';

class SignInScreen extends StatelessWidget {
  static const String id = "sign_in_page";
  SignInScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(
          signInRepository: SignInRepositoryImpl(
              signInRemoteDataSource:
                  SignInRemoteDataSourceImpl(dio: DioProvider()))),
      child: Scaffold(
        body: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is SignInFailureState) {
              print(state.errorMessage);

              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  MySnackBar.errorMessage(
                    message: state.errorMessage,
                  ),
                );
            } else if (state is SignInSuccessState) {
              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(
                  MySnackBar.successMessage(
                    message: "Login Successfull",
                  ),
                );

              Navigator.pushNamed(context, HomeScreen.id
              );
            }
          },
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      style: textStyleF20W400(),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: userNameController,
                      hintText: 'Username',
                      borderRadius: 9,
                      validator: (value) {
                        return FormValidator.validateText(value: value ?? "");
                      },
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      obscureText: true,
                      controller: passwordController,
                      hintText: 'password',
                      borderRadius: 9,
                      validator: (value) {
                        return FormValidator.validateText(value: value ?? "");
                      },
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 40),
                    BlocBuilder<SignInBloc, SignInState>(
                      builder: (context, state) {
                        if (state is SignInLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return CustomButton(
                          onTap: () {
                            BlocProvider.of<SignInBloc>(context).add(
                              LoggedInEvent(
                                signInRequestModel: SignInRequestModel(
                                  userName: userNameController.text,
                                  password: passwordController.text,
                                  utc: 6,
                                ),
                              ),
                            );
                          },
                          isSelected: true,
                          btnColor: secondaryTextColor,
                          textColor: whiteColor,
                          text: 'Sign in',
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
