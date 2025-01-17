import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:flutter/material.dart';

class IncomeExpenceCard extends StatefulWidget {
  final String title;
  final double amount;
  final String imgUrl;
  final Color bgColor;
  const IncomeExpenceCard({
    super.key,
    required this.title,
    required this.amount,
    required this.imgUrl,
    required this.bgColor,
  });

  @override
  State<IncomeExpenceCard> createState() => _IncomeExpenceCardState();
}

class _IncomeExpenceCardState extends State<IncomeExpenceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // ignore: deprecated_member_use
          colors: [widget.bgColor, kOrange.withOpacity(0.8)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: kLightGrey,
            offset: Offset(1, 2)
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(
                  widget.imgUrl,
                  width: 40,
                  height: 40,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: kWhite,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "\$ ${widget.amount.toStringAsFixed(0)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: kWhite,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
