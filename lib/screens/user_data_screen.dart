import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:fiscal_focus_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //Padding
  final double fieldPadding = 20;
  //CheckBox
  bool _rememberMe = false;
  //Key
  final _fromKey = GlobalKey<FormState>();
  //Controllers
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override    
  void dispose(){
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Text(
                  "Enter Your Personal Details",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: kGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: kSizedBoxValue * 2,
                ),
                Form(
                  key: _fromKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Name
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: kTextFieldColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: kBlack,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: kGrey,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: fieldPadding,
                            vertical: fieldPadding,
                          ),
                          hintText: "Name",
                          hintStyle: TextStyle(
                            color: kGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSizedBoxValue,
                      ),
                      //Email
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: kTextFieldColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: kBlack,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: kGrey,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: fieldPadding,
                            vertical: fieldPadding,
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: kGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSizedBoxValue,
                      ),
                      //Password
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: kTextFieldColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: kBlack,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: kGrey,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: fieldPadding,
                            vertical: fieldPadding,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: kGrey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSizedBoxValue,
                      ),
                      //Confirm Password
                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Confirm Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: kTextFieldColor,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 3, color: kBlack),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: kGrey,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: fieldPadding,
                            vertical: fieldPadding,
                          ),
                          hintText: "Confirm Password",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: kGrey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kSizedBoxValue * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Remember Me for the Next Time",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: kGrey,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: kSizedBoxValue * 4,
                          ),
                          Expanded(
                            child: Checkbox(
                              activeColor: kGreen,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _rememberMe = value!;
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kSizedBoxValue * 2,
                      ),
                      GestureDetector(
                        onTap: (){
                          if(_fromKey.currentState!.validate()){
                            String _userName = _userNameController.text;
                            String _email = _emailController.text;
                            String _password = _passwordController.text;
                            String _confirmPassword = _confirmPasswordController.text;
                          }
                        },
                        child: CustomButton(
                          buttonName: "Next",
                          buttonColor: kLightYellow,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
