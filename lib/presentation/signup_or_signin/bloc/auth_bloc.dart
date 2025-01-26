import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(): super(const AuthState()){
  on<ShowPasswordSignIn>(_showPasswordSignIn);
  on<ShowPasswordSignUp>(_showPasswordSignUp);

  }

  void _showPasswordSignIn(ShowPasswordSignIn event,Emitter<AuthState> emit){
    emit(state.copyWith(showPasswordSignIn: !state.showPasswordSignIn));
  }
  void _showPasswordSignUp(ShowPasswordSignUp event,Emitter<AuthState> emit){
    emit(state.copyWith(showPasswordSignUp: !state.showPasswordSignUp));
  }

}
