import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeLineChart extends StatefulWidget {
  const HomeLineChart({super.key});

  @override
  State<HomeLineChart> createState() => _HomeLineChartState();
}
class _HomeLineChartState extends State<HomeLineChart> {
  List<Color> gradientColors = [kGreen, kLightYellow];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 1.70,
          child: Padding(
            padding: EdgeInsets.only(
              right: 10,
              left: 4,
              top: 5,
              bottom: 10,
            ),
            child: LineChart(
              mainData(),
            ),
          ),
        ),
      ],
    );
  }
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: kLightGrey,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('Mar', style: style);
        break;
      case 5:
        text = Text('jun', style: style);
        break;
      case 8:
        text = Text('Sep', style: style);
        break;
      default:
        text = Text(
          '',
          style: style,
        );
        break;
    }
    return SideTitleWidget(
      meta: meta,
      child: text,
    );
  }
  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
      color: kLightGrey,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '10k';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }
    return Text(text, style: style, textAlign: TextAlign.left);
  }
  LineChartData mainData() {
    return LineChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            reservedSize: 30,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 4,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  // ignore: deprecated_member_use
                  .map((color) => color.withOpacity(0.4))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
