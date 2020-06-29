import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_chart.dart';

class StatCard extends StatefulWidget {
  final String title, figure;
  final Color color;
  final List<FlSpot> spots;
  const StatCard({Key key, this.title, this.figure, this.color, this.spots})
      : super(key: key);
  @override
  _StatCardState createState() => _StatCardState();
}

class _StatCardState extends State<StatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 12,
              height: 2,
              color: Color(0xFF6C63FF),
            ),
          ),
          Row(children: <Widget>[
            Text(widget.figure,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LineReportChart(
                color: widget.color,
                spots: widget.spots,
              ),
            ))
          ]),
        ],
      ),
    );
  }
}
