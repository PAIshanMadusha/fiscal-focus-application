import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:fiscal_focus_app/models/income_model.dart';
import 'package:fiscal_focus_app/widgets/expense_card.dart';
import 'package:fiscal_focus_app/widgets/income_card.dart';
import 'package:flutter/material.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';

class TransactionScreen extends StatefulWidget {
  final List<Income> incomeList;
  final List<Expence> expencesList;

  //Delete Function
  final void Function(Expence) dismissedExpense;
  //Delete Function
  final void Function(Income) dismissedIncome;

  const TransactionScreen({
    super.key,
    required this.incomeList,
    required this.expencesList,
    required this.dismissedExpense, 
    required this.dismissedIncome,
  });

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "See your Fiscal Report",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: kGrey,
                ),
              ),
              SizedBox(
                height: kSizedBoxValue,
              ),
              Text(
                "Expenses",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: kRed,
                ),
              ),
              SizedBox(
                height: kSizedBoxValue,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.31,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.expencesList.length,
                        itemBuilder: (context, index) {
                          final expense = widget.expencesList[index];
                          return Dismissible(
                            key: ValueKey(expense),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              setState(() {
                                widget.dismissedExpense(expense);
                              });
                            },
                            child: ExpenseCard(
                              title: expense.title,
                              date: expense.date,
                              amount: expense.amount,
                              category: expense.category,
                              description: expense.description,
                              time: expense.time,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: kSizedBoxValue,
              ),
              Text(
                "Incomes",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kGreen,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: kSizedBoxValue,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.31,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.incomeList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final income = widget.incomeList[index];
                            return Dismissible(
                              key: ValueKey(income),
                              direction: DismissDirection.startToEnd,
                              onDismissed: (direction){
                                setState((){
                                  widget.dismissedIncome(income);
                                });
                              },
                              child: IncomeCard(
                                title: income.title,
                                date: income.date,
                                amount: income.amount,
                                category: income.category,
                                description: income.description,
                                time: income.time,
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
