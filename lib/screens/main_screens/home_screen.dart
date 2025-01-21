import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:fiscal_focus_app/models/income_model.dart';
import 'package:fiscal_focus_app/services/user_service.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:fiscal_focus_app/widgets/expense_card.dart';
import 'package:fiscal_focus_app/widgets/home_line_chart.dart';
import 'package:fiscal_focus_app/widgets/income_expence_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Expence> expenseList;
  final List<Income> incomeList;
  const HomeScreen({
    super.key,
    required this.expenseList,
    required this.incomeList,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "";
  double incomeTotal = 0;
  double expenseTotal = 0;

  @override
  void initState() {
    UserService.getUserData().then((value) {
      if (value["userName"] != null) {
        setState(() {
          userName = value["userName"]!;
        });
      }
    });
    setState(() {
        for (var i = 0; i < widget.incomeList.length; i++) {
          incomeTotal += widget.incomeList[i].amount;
        }
        for (var i = 0; i < widget.expenseList.length; i++) {
          expenseTotal += widget.expenseList[i].amount;
        }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                    gradient: LinearGradient(
                      colors: [kLightYellow, kTextFieldColor],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    boxShadow: [
                      BoxShadow(color: kTextFieldColor, offset: Offset(1, 2)),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: kTextFieldColor,
                                )),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.asset(
                                "assets/images/ishan.jpg",
                                width: 65,
                                height: 65,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "WELCOME ${userName.toUpperCase()}",
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w800,
                              color: kBlack,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications,
                              size: 38,
                              color: kBlack,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: kSizedBoxValue * 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IncomeExpenceCard(
                            title: "Income",
                            amount: incomeTotal,
                            imgUrl: "assets/images/income.png",
                            bgColor: kGreen,
                          ),
                          IncomeExpenceCard(
                            title: "Expence",
                            amount: expenseTotal,
                            imgUrl: "assets/images/spendingmoney.png",
                            bgColor: kRed,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Column(
                  children: [
                    Text(
                      "Speed Frequency",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: kGrey,
                      ),
                    ),
                    SizedBox(
                      height: kSizedBoxValue,
                    ),
                    HomeLineChart(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding,
                ),
                child: Column(
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: kGrey,
                      ),
                    ),
                    SizedBox(
                      height: kSizedBoxValue,
                    ),
                    widget.expenseList.isEmpty
                        ? Text(
                            "Item not Added Yet, Navigate to Transaction and Add Some Item",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: kGrey,
                            ),
                            textAlign: TextAlign.center,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            itemCount: widget.expenseList.length,
                            itemBuilder: (context, index) {
                              final expense = widget.expenseList[index];
                              return ExpenseCard(
                                title: expense.title,
                                date: expense.date,
                                amount: expense.amount,
                                category: expense.category,
                                description: expense.description,
                                time: expense.time,
                              );
                            },
                          )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
