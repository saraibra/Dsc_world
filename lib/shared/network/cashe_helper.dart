import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }
    static bool? getData(
      {required String key})  {
    return  sharedPreferences.getBool(key);
  }

  static Future setFavourite({required String key , bool? value})async{
    return await sharedPreferences.setBool(key, value!);

  }
  static Future setFavourites({required String key ,required List<String> values})async{
    return await sharedPreferences.setStringList(key, values);

  }
   static dynamic getFavourite({required String key}){
    return  sharedPreferences.get(key);

  }
     static dynamic getFavourites({required String key}){
    return  sharedPreferences.getStringList(key);

  }
}