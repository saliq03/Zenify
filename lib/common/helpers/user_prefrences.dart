import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  setLoginKey(bool value) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setBool('isLogin', value);
  }
  Future<bool> isLogin() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool? loginKey= sp.getBool('isLogin');
    if(loginKey==true) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> saveUser(String email) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("Email",email);
    return true;
  }

  Future<String?>  getUser() async {

    SharedPreferences sp=await SharedPreferences.getInstance();

    final email=sp.getString("Email");

    return email;
  }

  Future<bool> removeUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}