
import 'package:shared_preferences/shared_preferences.dart';

class AppConstant {

  static const  String PREF_USER_NAME = "user_email";
  static const String  PREF_IS_LOGIN = "is_login";

  static Future<SharedPreferences> getPrefrence(){
    return SharedPreferences.getInstance();
  }

}