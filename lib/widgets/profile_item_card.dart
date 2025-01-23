import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:flutter/material.dart';

class ProfileItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color box;

  const ProfileItemCard({
    super.key,
    required this.title,
    required this.icon,
    required this.box,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding,
      ),
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      width: MediaQuery.of(context).size.width * double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kWhite,
        boxShadow: [
          BoxShadow(
            color: kTextFieldColor,
            offset: Offset(2, 2),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // ignore: deprecated_member_use
              color: box.withOpacity(0.3),
            ),
            child: Center(
              child: Icon(icon, size: 40, color: box,),
            ),
          ),
          SizedBox(
            width: kSizedBoxValue,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: kLightGrey,
            ),
          )
        ],
      ),
    );
  }
}
