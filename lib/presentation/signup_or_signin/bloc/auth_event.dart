part of 'auth_bloc.dart';

 class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];
 }
 class ShowPasswordSignIn extends AuthEvent{}
class ShowPasswordSignUp extends AuthEvent{}

class SignUpWithEmailAndPassword extends AuthEvent{
  final String name, email, password;
  SignUpWithEmailAndPassword({required this.name, required this.email, required this.password});
  @override
  List<Object?> get props => [name, email, password];
 }

class SignInWithEmailAndPassword extends AuthEvent{
 final String  email, password;
 SignInWithEmailAndPassword({required this.email, required this.password});
 @override
 List<Object?> get props => [email, password];
}
