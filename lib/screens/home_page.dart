import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_dashboard/data/dummy_repo.dart';
import 'package:shop_dashboard/widgets/stat_card.dart';
import 'package:shop_dashboard/widgets/weekly_bar_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DummyRepo dummyRepo = DummyRepo();

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
          Icons.brightness_3,
          color: Color(0xFF6C63FF),
        ),
        title: Text("Dashboard",
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.list, color: Color(0xFF6C63FF)),
              onPressed: () => Navigator.pushNamed(context, '/orders'))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          GridView
              .count(shrinkWrap: true, crossAxisCount: 2, children: <Widget>[
            StreamBuilder(
              stream: dummyRepo.getData("total_orders").onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return StatCard(
                    title: "Total Orders.",
                    figure:
                        snapshot.data.snapshot.value['total_amount'].toString(),
                    color: Colors.green,
                    spots:
                        dummyRepo.generateFLSpots(snapshot.data.snapshot.value),
                  );
                } else {
                  return Text("...");
                }
              },
            ),
            StreamBuilder(
              stream: dummyRepo.getData("orders_received").onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return StatCard(
                    title: "Orders Received.",
                    figure:
                        snapshot.data.snapshot.value['total_amount'].toString(),
                    color: Colors.red,
                    spots:
                        dummyRepo.generateFLSpots(snapshot.data.snapshot.value),
                  );
                } else {
                  return Text("...");
                }
              },
            ),
            StreamBuilder(
              stream: dummyRepo.getData("orders_delivered").onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return StatCard(
                    title: "Orders Delivered.",
                    figure:
                        snapshot.data.snapshot.value['total_amount'].toString(),
                    color: Colors.red,
                    spots:
                        dummyRepo.generateFLSpots(snapshot.data.snapshot.value),
                  );
                } else {
                  return Text("...");
                }
              },
            ),
            StreamBuilder(
              stream: dummyRepo.getData("customers").onValue,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return StatCard(
                    title: "Customers",
                    figure:
                        snapshot.data.snapshot.value['total_amount'].toString(),
                    color: Colors.red,
                    spots:
                        dummyRepo.generateFLSpots(snapshot.data.snapshot.value),
                  );
                } else {
                  return Text("...");
                }
              },
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Text(
                  "This Week's Sales",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
