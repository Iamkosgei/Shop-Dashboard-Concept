import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeeklyBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WeeklyBarChartState();
}

class WeeklyBarChartState extends State<WeeklyBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF6C63FF).withOpacity(.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 20,
              barTouchData: BarTouchData(
                enabled: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  tooltipBottomMargin: 8,
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.y.round().toString(),
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: SideTitles(
                  showTitles: true,
                  textStyle: TextStyle(
                      color: const Color(0xff7589a2),
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  margin: 20,
                  getTitles: (double value) {
                    switch (value.toInt()) {
                      case 0:
                        return 'Mn';
                      case 1:
                        return 'Te';
                      case 2:
                        return 'Wd';
                      case 3:
                        return 'Tu';
                      case 4:
                        return 'Fr';
                      case 5:
                        return 'St';
                      case 6:
                        return 'Sn';
                      default:
                        return '';
                    }
                  },
                ),
                leftTitles: SideTitles(showTitles: false),
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: [
                BarChartGroupData(
                    x: 0,
                    barRods: [BarChartRodData(y: 8, color: Color(0xFF6C63FF))],
                    showingTooltipIndicators: [0]),
                BarChartGroupData(
                    x: 1,
                    barRods: [BarChartRodData(y: 10, color: Color(0xFF6C63FF))],
                    showingTooltipIndicators: [0]),
                BarChartGroupData(
                    x: 2,
                    barRods: [BarChartRodData(y: 14, color: Color(0xFF6C63FF))],
                    showingTooltipIndicators: [0]),
                BarChartGroupData(
                    x: 3,
                    barRods: [BarChartRodData(y: 15, color: Color(0xFF6C63FF))],
                    showingTooltipIndicators: [0]),
                BarChartGroupData(
                    x: 3,
                    barRods: [BarChartRodData(y: 13, color: Color(0xFF6C63FF))],
                    showingTooltipIndicators: [0]),
                BarChartGroupData(
                    x: 3,
                    barRods: [BarChartRodData(y: 10, color: Color(0xFF6C63FF))],
                    showingTooltipIndicators: [0]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
