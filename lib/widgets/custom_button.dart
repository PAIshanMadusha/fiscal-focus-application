import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final Color buttonColor;

  const CustomButton({
    super.key,
    required this.buttonName,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: LinearGradient(
          colors: [buttonColor, Color.fromARGB(255, 253, 30, 97)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: kWhite,
          ),
        ),
      ),
    );
  }
}
