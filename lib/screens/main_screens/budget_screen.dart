import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:fiscal_focus_app/models/income_model.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:fiscal_focus_app/widgets/budget_pie_chart.dart';
import 'package:fiscal_focus_app/widgets/category_line_card.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends StatefulWidget {
  final Map<IncomeCategory, double> incomeCategoryTotal;
  final Map<ExpenceCategory, double> expenceCategoryTotal;
  const BudgetScreen({
    super.key,
    required this.incomeCategoryTotal,
    required this.expenceCategoryTotal,
  });

  @override
  State<BudgetScreen> createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> {
  int _selectedMode = 0;

  //For Category Color Find
  Color getCategoryColor (dynamic category){
    if(category is IncomeCategory){
      return incomeCategoryColor[category]!;
    }else{
      return expenceCategoriesColor[category]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = _selectedMode == 0
        ? widget.incomeCategoryTotal
        : widget.expenceCategoryTotal;
    return Scaffold(
      backgroundColor: kTextFieldColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: kDefaultPadding,
              horizontal: kDefaultPadding,
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Financial Report",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: kGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: kSizedBoxValue,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.height * double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kWhite,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMode = 0;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _selectedMode == 0 ? kGreen : kWhite,
                          ),
                          child: Center(
                            child: Text(
                              "Income",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _selectedMode == 0 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMode = 1;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 180,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: _selectedMode == 1 ? kRed : kWhite,
                          ),
                          child: Center(
                            child: Text(
                              "Expence",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: _selectedMode == 1 ? kWhite : kBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: kSizedBoxValue * 2,
                ),
                BudgetPieChart(
                  incomeCategoryTotal: widget.incomeCategoryTotal,
                  expenceCategoryTotal: widget.expenceCategoryTotal,
                  isIncome: _selectedMode == 0,
                ),
                SizedBox(
                  height: kSizedBoxValue * 2,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final category = data.keys.toList()[index];
                        final total = data.values.toList()[index];
                        return CategoryLineCard(
                          title: category.name,
                          amount: total,
                          total: data.values.reduce((value, element) => value + element),
                          progressColor: getCategoryColor(category),
                          isIncome: _selectedMode == 0,
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
