import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/firstImage.jpg",
            width: 445,
            height: 445,
            fit: BoxFit.cover,
          ),
          Text(
            "Fiscal Focus",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w800,
              color: kBlack,
            ),
          ),
          SizedBox(
            height: kSizedBoxValue,
          ),
          Text(
            "Compare and Manage Your Income and Expense",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: kGrey,
            ),
          ),
        ],
      ),
    );
  }
}
