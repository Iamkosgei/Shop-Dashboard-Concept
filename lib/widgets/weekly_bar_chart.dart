import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:shop_dashboard/data/dummy_repo.dart';

class WeeklyBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WeeklyBarChartState();
}

class WeeklyBarChartState extends State<WeeklyBarChart> {
  @override
  Widget build(BuildContext context) {
    DummyRepo dummyRepo = DummyRepo();
    return AspectRatio(
        aspectRatio: 1.7,
        child: Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: StreamBuilder(
              stream: dummyRepo.getDataWeeksSales().onValue,
              builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
                if (snapshot.hasData) {
                  return BarChart(
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
                        barGroups: snapshot.data.snapshot.value
                            .map<BarChartGroupData>((item) => BarChartGroupData(
                                    x: item['x'],
                                    barRods: [
                                      BarChartRodData(
                                          y: item['y'].toDouble(),
                                          color: Color(0xFF6C63FF))
                                    ],
                                    showingTooltipIndicators: [
                                      0
                                    ]))
                            .toList()),
                  );
                } else {
                  return Text("....");
                }
              },
            ),
          ),
        ));
  }
}
