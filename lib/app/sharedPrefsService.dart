import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsSerivce{

  static SharedPreferences prefs;
  static int currentUserId;
  static String currentUserFirstName;
  static String currentUserRole;

  static void wipe(){
    prefs.clear();
  }
  static Future<void>  initPrefs() async{
    prefs = await SharedPreferences.getInstance();
    currentUserFirstName = prefs.getString("firstName");
    currentUserId = prefs.getInt("idUser");
    currentUserRole = prefs.getString("role");

  }
}