// import 'package:bloc_project/model/user.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesUser {
//   static const String userAuthentic = "userAuthentic";
//   static Future<void> saveUser(User user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(userAuthentic, user.toJson());
//   }

//   static Future<User> getUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     final String? user = prefs.getString(userAuthentic);
//     return user != null ? User.fromJson(user) : User("", "");
//   }

//   static Future<void> clearUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(userAuthentic);
//   }
// }
