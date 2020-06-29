import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shop_dashboard/models/orders.dart';

class DummyRepo {
  final databaseReference = FirebaseDatabase.instance.reference();

  DatabaseReference getData(String value) {
    return databaseReference.child(value);
  }

  DatabaseReference getDataWeeksSales() {
    return databaseReference.child("weekly_sales");
  }

  List<FlSpot> generateFLSpots(var input) {
    List<FlSpot> data = List();
    List<Order> orders =
        Orders.fromJson(json.decode(json.encode(input))).orders;
    for (Order order in orders) {
      data.add(FlSpot(order.key.toDouble(), order.value.toDouble()));
    }
    return data;
  }
}
