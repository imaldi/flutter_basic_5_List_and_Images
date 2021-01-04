import 'package:flutter/material.dart';

class HorizontalListViewScreen extends StatefulWidget {
  @override
  _HorizontalListViewScreenState createState() => _HorizontalListViewScreenState();
}

class _HorizontalListViewScreenState extends State<HorizontalListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Kontak"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              color: Colors.red,
            ),
            Container(
              width: 160.0,
              color: Colors.orange,
            ),
            Container(
              width: 160.0,
              color: Colors.yellow,
            ),
            Container(
              width: 160.0,
              color: Colors.green,
            ),
            Container(
              width: 160.0,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
