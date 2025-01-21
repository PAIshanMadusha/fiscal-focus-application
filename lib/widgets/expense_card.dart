import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final String title;
  final DateTime date;
  final double amount;
  final ExpenceCategory category;
  final String description;
  final DateTime time;

  const ExpenseCard({
    super.key,
    required this.title,
    required this.date,
    required this.amount,
    required this.category,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kWhite,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: kBlack.withOpacity(0.12),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // ignore: deprecated_member_use
              color: expenceCategoriesColor[category]!.withOpacity(0.17),
            ),
            child: Image.asset(
              expenceCategoriesImages[category]!,
              height: 10,
              width: 10,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: kSizedBoxValue,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kBlack,
                ),
              ),
              SizedBox(
                width: 160,
                child: Text(
                  description,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                    color: kLightGrey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-\$${amount.toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kRed,
                ),
              ),
              Text(
                DateFormat.jm().format(date),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: kLightGrey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
