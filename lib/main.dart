import 'package:fiscal_focus_app/screens/onboarding_screens.dart';
import 'package:fiscal_focus_app/services/user_service.dart';
import 'package:fiscal_focus_app/widgets/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService.checkUserName(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return const CircularProgressIndicator();
        }else{
          bool hasUserName = snapshot.data ?? false;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Fiscal Focus App",
            theme: ThemeData(fontFamily: "Inter",),
            home: Wrapper(showMainScreen: hasUserName),
          );
        }
      },
      );
  }
}