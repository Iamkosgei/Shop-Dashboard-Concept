import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_dashboard/data/data.dart';
import 'package:shop_dashboard/widgets/stat_card.dart';
import 'package:shop_dashboard/widgets/weekly_bar_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.home,
          color: Color(0xFF6C63FF),
        ),
        title: Text("Dashboard",
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.list,
              color: Color(0xFF6C63FF),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              children: <Widget>[
                StatCard(
                  title: "Total Orders.",
                  figure: "200",
                  color: Colors.green,
                  spots: DummyData.positiveData,
                ),
                StatCard(
                  title: "Orders Received.",
                  figure: "800",
                  color: Colors.red,
                  spots: DummyData.negativeData,
                ),
                StatCard(
                  title: "Orders Delivered",
                  figure: "2000",
                  color: Colors.red,
                  spots: DummyData.negativeData,
                ),
                StatCard(
                  title: "Customers.",
                  figure: "34030",
                  color: Colors.green,
                  spots: DummyData.positiveData,
                ),
              ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "This Week's Sales",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                WeeklyBarChart(),
              ],
            ),
          )
        ],
      )),
    );
  }
}
