import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static Future<void> storeUserDetails({
    required userName,
    required email,
    required password,
    required confirmPassword,
    required BuildContext context,
  }) async {
    //password
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password and ConfirmPassword Doesn't Match"),
        ),
      );
      return;
    }
    //If Password and ConfirmPassword are the Same
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      //Store
      await pref.setString("userName", userName);
      await pref.setString("email", email);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User Details Stored Succesfully!"),
        ),
      );
    } catch (err) {
      err.toString();
    }
  }

  //check userName
  static Future<bool> checkUserName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString("userName");
    return userName != null;
  }

  //Get Username/ Email
  static Future<Map<String, String>> getUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    String? userName = pref.getString("userName");
    String? email = pref.getString("email");

    return {"userName": userName!, "email": email!};
  }
}
