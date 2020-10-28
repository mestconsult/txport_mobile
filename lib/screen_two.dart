import 'package:flutter/material.dart';

class DemoScreenTwo extends StatefulWidget {
  final String title;

  DemoScreenTwo({Key key, this.title}) : super(key: key);

  @override
  _DemoScreenTwoState createState() => _DemoScreenTwoState();
}

class _DemoScreenTwoState extends State<DemoScreenTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 20,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.red),
        child: Text('This is screen 2',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}

// 0xFFFACBC3
// 0xFFE66969
