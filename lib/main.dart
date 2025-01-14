import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fiscal Focus",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
      ),
      home: Scaffold(
        body: Center(child: Text("My Name is Ishan", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),),
      ),
    );
  }
}