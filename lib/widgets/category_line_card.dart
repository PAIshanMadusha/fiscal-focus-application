import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:flutter/material.dart';

class CategoryLineCard extends StatefulWidget {
  final String title;
  final double amount;
  final double total;
  final Color progressColor;
  final bool isIncome;

  const CategoryLineCard({
    super.key,
    required this.title,
    required this.amount,
    required this.total,
    required this.progressColor,
    required this.isIncome,
  });

  @override
  State<CategoryLineCard> createState() => _CategoryLineCardState();
}

class _CategoryLineCardState extends State<CategoryLineCard> {
  @override
  Widget build(BuildContext context) {

    double progreesWidth = widget.total != 0 ? MediaQuery.of(context).size.width * (widget.amount/widget.total) : 0;
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kWhite,
        boxShadow: [
          BoxShadow(
            color: kTextFieldColor,
            offset: Offset(2, 2),
            spreadRadius: 2,
            blurRadius: 1,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: widget.progressColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: kLightGrey,
                        ),
                      ),
                      SizedBox(
                        width: kSizedBoxValue,
                      ),
                      Text(
                        "${(widget.amount / widget.total * 100).toStringAsFixed(2)}%",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: kLightGrey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                "${widget.amount.toStringAsFixed(2)}\$",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: widget.isIncome ? kGreen : kRed,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 10,
            width: progreesWidth,
            decoration: BoxDecoration(
              color: widget.progressColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
