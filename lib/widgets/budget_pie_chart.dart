import 'package:fiscal_focus_app/models/expence_model.dart';
import 'package:fiscal_focus_app/models/income_model.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/utils/constance.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BudgetPieChart extends StatefulWidget {
  final Map<IncomeCategory, double> incomeCategoryTotal;
  final Map<ExpenceCategory, double> expenceCategoryTotal;
  final bool isIncome;
  const BudgetPieChart({
    super.key,
    required this.incomeCategoryTotal,
    required this.expenceCategoryTotal,
    required this.isIncome,
  });

  @override
  State<BudgetPieChart> createState() => _BudgetPieChartState();
}

class _BudgetPieChartState extends State<BudgetPieChart> {
  List<PieChartSectionData> getCharts() {
    if (widget.isIncome) {
      return [
        PieChartSectionData(
          color: incomeCategoryColor[IncomeCategory.freelance],
          value: widget.incomeCategoryTotal[IncomeCategory.freelance] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColor[IncomeCategory.passive],
          value: widget.incomeCategoryTotal[IncomeCategory.passive] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColor[IncomeCategory.salery],
          value: widget.incomeCategoryTotal[IncomeCategory.salery] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: incomeCategoryColor[IncomeCategory.sales],
          value: widget.incomeCategoryTotal[IncomeCategory.salery] ?? 0,
          showTitle: false,
          radius: 60,
        ),
      ];
    } else {
      return [
        PieChartSectionData(
          color: expenceCategoriesColor[ExpenceCategory.food],
          value: widget.expenceCategoryTotal[ExpenceCategory.food] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenceCategoriesColor[ExpenceCategory.health],
          value: widget.expenceCategoryTotal[ExpenceCategory.health] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenceCategoriesColor[ExpenceCategory.shopping],
          value: widget.expenceCategoryTotal[ExpenceCategory.shopping] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenceCategoriesColor[ExpenceCategory.subscriptions],
          value:
              widget.expenceCategoryTotal[ExpenceCategory.subscriptions] ?? 0,
          showTitle: false,
          radius: 60,
        ),
        PieChartSectionData(
          color: expenceCategoriesColor[ExpenceCategory.transport],
          value: widget.expenceCategoryTotal[ExpenceCategory.transport] ?? 0,
          showTitle: false,
          radius: 60,
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final PieChartData pieChartData = PieChartData(
        centerSpaceColor: kTextFieldColor,
        sectionsSpace: 3,
        centerSpaceRadius: 90,
        startDegreeOffset: -90,
        sections: getCharts(),
        borderData: FlBorderData(
          show: false,
        ));
    return Container(
      height: 280,
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(pieChartData),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "70%",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: kGrey,
                ),
              ),
              Text(
                "of 100%",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                  color: kGrey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
