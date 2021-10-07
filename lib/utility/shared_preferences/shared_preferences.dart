import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
 static Future setString({key, value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

 static Future getString({key, value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key)??'';
  }
}
