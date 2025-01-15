import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:flutter/material.dart';

class SharedOnboardingScreen extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String description;

  const SharedOnboardingScreen({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imgUrl,
            width: 445,
            height: 445,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
              color: kBlack,
            ),
          ),
          SizedBox(
            height: kSizedBoxValue,
          ),
          Text(
            description,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: kLightGrey,
              fontSize: 16
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
