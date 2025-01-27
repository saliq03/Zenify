part of 'auth_bloc.dart';

 class AuthEvent extends Equatable{
  @override
  List<Object?> get props => [];
 }
 class ShowPasswordSignIn extends AuthEvent{}
class ShowPasswordSignUp extends AuthEvent{}

class SignUpWithEmailAndPassword extends AuthEvent{
  final String name, email, password;
  final BuildContext context;
  SignUpWithEmailAndPassword({required this.name, required this.email, required this.password,required this.context});
  @override
  List<Object?> get props => [name, email, password, context];
 }

class SignInWithEmailAndPassword extends AuthEvent{
 final String  email, password;
 final BuildContext context;
 SignInWithEmailAndPassword({required this.email, required this.password,required this.context});
 @override
 List<Object?> get props => [email, password, context];
}
