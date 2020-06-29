import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Orders",
            style: TextStyle(
              color: Colors.black,
            )),
        centerTitle: true,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Color(0xFF6C63FF)),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            elevation: 2,
            child: ClipPath(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Colors.green, width: 5))),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
            ),
          ),
          Card(
            elevation: 2,
            child: ClipPath(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    border:
                        Border(left: BorderSide(color: Colors.red, width: 5))),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
            ),
          ),
          Card(
            elevation: 2,
            child: ClipPath(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(color: Colors.yellow, width: 5))),
              ),
              clipper: ShapeBorderClipper(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3))),
            ),
          )
        ],
      ),
    );
  }
}
