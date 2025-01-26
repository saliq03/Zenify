part of 'auth_bloc.dart';

 class AuthState extends Equatable{
   final bool showPasswordSignIn;
   final bool showPasswordSignUp;
   final bool loadingSignIn;
   final bool loadingSignUp;

  const AuthState({
    this.showPasswordSignIn=true,
   this.showPasswordSignUp=true,
  this.loadingSignIn=false,
  this.loadingSignUp=false});

  AuthState copyWith({bool? showPasswordSignIn, bool? showPasswordSignUp,bool? loadingSignIn, bool? loadingSignUp}){
    return AuthState(
        showPasswordSignIn: showPasswordSignIn??this.showPasswordSignIn,
        showPasswordSignUp: showPasswordSignUp??this.showPasswordSignUp,
        loadingSignIn: loadingSignIn?? this.loadingSignIn,
        loadingSignUp: loadingSignUp?? this.loadingSignUp
    );
   }


  @override
  // TODO: implement props
  List<Object?> get props => [showPasswordSignIn, showPasswordSignUp, loadingSignIn, loadingSignUp];

 }


