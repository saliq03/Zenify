

import 'package:spotify/business/entities/user.dart';

class UserModel {
 final String name;
 final  String email;
 String? imageUrl;

  UserModel({required this.name, required this.email,this.imageUrl});

 factory UserModel.fromJson(Map<String,dynamic> data){
   return UserModel(
     name: data["Name"],
     email: data["Email"],
   );
 }

 toJson(){
   return {"Name":name, "Email":email};
 }
}

extension UserModelx on UserModel{
 UserEntity toUserEntity(){
    return UserEntity(
        name: name,
        email: email,
        imageUrl: imageUrl!);
  }
}