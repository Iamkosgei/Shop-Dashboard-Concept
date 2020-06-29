import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_dashboard/data/dummy_repo.dart';
import 'package:shop_dashboard/models/PlacedOrder.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  DummyRepo dummyRepo = DummyRepo();
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        systemNavigationBarColor: Colors.black,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          brightness: Theme.of(context).brightness,
          elevation: 8.0,
          title: Text("Orders", style: Theme.of(context).textTheme.headline3),
          centerTitle: true,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: Color(0xFF6C63FF)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: dummyRepo.getData("orders").onValue,
            builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
              if (snapshot.hasData) {
                List<PlacedOrder> placedOrders = List();
                snapshot.data.snapshot.value.map((placedOrder) {
                  placedOrders.add(PlacedOrder.fromJson(
                      json.decode(json.encode(placedOrder))));
                }).toList();

                return ListView.builder(
                  itemCount: placedOrders.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 2,
                      child: ClipPath(
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    left: BorderSide(
                                        color: placedOrders[index].status == 1
                                            ? Colors.green
                                            : placedOrders[index].status == 2
                                                ? Colors.yellow
                                                : Colors.red,
                                        width: 5))),
                            child: ListTile(
                              title: Text(placedOrders[index].name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      'KES ${placedOrders[index].amount.toString()}'),
                                  Text(
                                      'status: ${placedOrders[index].status == 1 ? "delivered" : placedOrders[index].status == 2 ? "shipping" : "cancelled"}'),
                                ],
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,
                                  color: Color(0xFF6C63FF)),
                            )),
                        clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3))),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
