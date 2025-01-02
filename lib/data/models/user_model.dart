

class UserModel {
 final String name;
 final  String email;

  UserModel({required this.name, required this.email});

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
