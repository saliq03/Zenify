import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/business/usecases/user_preferences/set_login_key.dart';
import 'package:spotify/core/configs/constants/app_urls.dart';
import 'package:spotify/data/models/creat_user_request.dart';
import 'package:spotify/data/models/login_user_request.dart';

import '../../../service_locator.dart';
import '../../models/user_model.dart';

abstract class AuthFirebaseService{
  Future<Either> SigninWithEmailPassword(LoginUserRequest user);
  Future<Either> SignupWithEmailPassword(CreateUserRequest user);
  Future<Either> getCurrentUser();
  Future<Either> logoutUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<Either> SigninWithEmailPassword(LoginUserRequest user)async {

    try{
    var data=  await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: user.email,
          password: user.password);
     sL<SetLoginKeyUseCase>().call(params: true);

      return const Right("Signin was sucessful");
    }on FirebaseAuthException catch (e){
     String message ='';
     switch (e.code) {
       case 'invalid-email':
        message= 'The email address is not valid.';
        break;
       case 'user-not-found':
         message= 'No user found with this email address.';
         break;
       case 'wrong-password':
         message= 'The password is incorrect.';
         break;
       case 'user-disabled':
         message= 'This user account has been disabled.';
         break;
       case 'too-many-requests':
         message= 'Too many unsuccessful attempts. Please try again later.';
         break;
       case 'network-request-failed':
         message= 'Network error occurred. Please check your connection.';
         break;
       default:
         message= 'An error occurred: ${e.message}';
         break;
     }
     return Left(message);

    }

  }

  @override
  Future<Either> SignupWithEmailPassword(CreateUserRequest user) async {
    try{
    var data=  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.email,
          password: user.password);
    UserModel userModel=UserModel(name: user.name, email: data.user!.email!);
    FirebaseFirestore.instance.collection("Users").doc(data.user?.email).
    set(userModel.toJson());
    sL<SetLoginKeyUseCase>().call(params: true);
      return const Right('Signup was successful');
    } on FirebaseAuthException catch (e){

      String message='';
      switch (e.code) {
        case 'invalid-email':
          message= 'The email address is not valid.';
          break ;
        case 'email-already-in-use':
          message='An account already exist with that email';
          break ;
        case 'weak-password':
          message="The password provided is too weak";
          break ;

        case 'network-request-failed':
          message='Network error occurred. Please check your connection.';
          break ;
        default:
          message= 'An error occurred: ${e.message}';
          break ;
      }
      return Left(message);

    }
  }

  @override
  Future<Either> getCurrentUser() async{
    try{
      FirebaseAuth auth=FirebaseAuth.instance;
      FirebaseFirestore firestore=FirebaseFirestore.instance;

      var user=await firestore.collection("Users").doc(auth.currentUser?.email).get();
      UserModel userModel=UserModel.fromJson(user.data()!);
      userModel.imageUrl=auth.currentUser?.photoURL?? AppUrls.defaultImage;

      return right(userModel.toUserEntity());
    }catch(e){
      return left("an error occurred\n $e");
    }


  }

  @override
  Future<Either> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
     return const Right("Logout successful");
    } catch (e) {
      return const Left("An error occured");
    }
  }

}