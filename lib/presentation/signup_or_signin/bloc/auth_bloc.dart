import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../business/usecases/auth/signin_with_email.dart';
import '../../../business/usecases/auth/signup_with_EmailPassword.dart';
import '../../../data/models/creat_user_request.dart';
import '../../../data/models/login_user_request.dart';
import '../../../service_locator.dart';
import '../../bottom_nav/pages/bottom_nav.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(): super(const AuthState()){
  on<ShowPasswordSignIn>(_showPasswordSignIn);
  on<ShowPasswordSignUp>(_showPasswordSignUp);
  on<SignUpWithEmailAndPassword>(_signUpWithEmailPassword);
  on<SignInWithEmailAndPassword>(_signInWithEmailPassword);

  }

  void _showPasswordSignIn(ShowPasswordSignIn event,Emitter<AuthState> emit){
    emit(state.copyWith(showPasswordSignIn: !state.showPasswordSignIn));
  }
  void _showPasswordSignUp(ShowPasswordSignUp event,Emitter<AuthState> emit){
    emit(state.copyWith(showPasswordSignUp: !state.showPasswordSignUp));
  }
  void _signUpWithEmailPassword(SignUpWithEmailAndPassword event, Emitter<AuthState> emit)async{
    emit(state.copyWith(loadingSignUp: true));
    var result= await sL<SignupWithEmailPasswordUseCase>().call(
        params: CreateUserRequest(name: event.name,
            email: event.email,
            password: event.password)
    );
    result.fold(
            (l){
              emit(state.copyWith(loadingSignUp: false));
          ScaffoldMessenger.of(event.context).
          showSnackBar(SnackBar(content: Text(l),
            backgroundColor: Colors.red,));
        },
            (r){
          Navigator.pushAndRemoveUntil(
              event.context,
              MaterialPageRoute(builder: (context) => const BottomNavPage()),
                  (Route<dynamic> route) => false);
          emit(state.copyWith(loadingSignUp: false));


        });
  }

  void _signInWithEmailPassword(SignInWithEmailAndPassword event, Emitter<AuthState> emit)async{
    emit(state.copyWith(loadingSignIn: true));
    var result =await sL<SigninWithEmailPasswordUseCase>().call(
        params: LoginUserRequest(
            email: event.email,
            password: event.password)
    );
    result.fold(
            (l){
              emit(state.copyWith(loadingSignIn: false));
          ScaffoldMessenger.of(event.context).
          showSnackBar(SnackBar(content: Text(l),
            backgroundColor: Colors.red,));

        },
            (r){
          Navigator.pushAndRemoveUntil(
              event.context,
              MaterialPageRoute(builder: (context) => const BottomNavPage()),
                  (Route<dynamic> route) => false);
          emit(state.copyWith(loadingSignIn: false));

        });
  }

}
