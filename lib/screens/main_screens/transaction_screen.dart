import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:fiscal_focus_app/widgets/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';

class TransactionScreen extends StatefulWidget {
  final List<Expence> expencesList;
  //Delete Function
  final void Function(Expence) dismissedExpense;

  const TransactionScreen({
    super.key,
    required this.expencesList, 
    required this.dismissedExpense,
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
                  fontSize: 22,
                  color: kGrey,
                ),
              ),
              SizedBox(
                height: kSizedBoxValue,
              ),
              Text(
                "Expense",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kRed,
                ),
              ),
              SizedBox(
                height: kSizedBoxValue,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
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
                            onDismissed:(direction) {
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
            ],
          ),
        ),
      ),
    );
  }
}
