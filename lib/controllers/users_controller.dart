import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class userController {
  static Future<bool?> getlogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("Login");
  }

  static Future setlogin(bool login) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setBool("login", login);
  }
}
















// // ignore_for_file: dead_code

// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:si_kerja/model/users_model.dart';

// class UsersController {
//   static const VIEW_URL = "http://192.168.1.6/si_kerja/view.php";
//   static const REGISTER_URL = "http://192.168.1.6/si_kerja/register.php";
//   static const LOGIN_URL = "http://192.168.1.6/si_kerja/login.php";
//   static const DELETE_URL = "http://192.168.1.6/si_kerja/delete.php";
//   static const UPDATE_URL = "http://192.168.1.6/si_kerja/update.php";

//   List<usersModel> usersFromJson(String jsonstring) {
//     final data = json.decode(jsonstring);
//     return List<usersModel>.from(data.map((item) => usersModel.fromJson(item)));

//     // ignore: unused_element
//     Future<List<usersModel>> getusers() async {
//       // ignore: non_constant_identifier_names, unused_local_variable
//       String view_ip = "http://192.168.1.6/si_kerja/view.php";
//       final response = await http.get(Uri.parse(VIEW_URL));
//       if (response.statusCode == 200) {
//         List<usersModel> list = usersFromJson(response.body);
//         return list;
//       } else {
//         return <usersModel>[];
//       }
//     }
//   }

//   Future<String> addusers(usersModel useersModel) async {
//     final response = await http.post(Uri.parse(REGISTER_URL), body: usersModel);
//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       return "Error";
//     }
//   }

//   getusers() {}
// }