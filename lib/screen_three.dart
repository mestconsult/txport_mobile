import 'package:flutter/material.dart';

class DemoScreenThree extends StatefulWidget {
  final String title;
  DemoScreenThree({Key key, this.title}) : super(key: key);
  @override
  _DemoScreenThreeState createState() => _DemoScreenThreeState();
}

class _DemoScreenThreeState extends State<DemoScreenThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 20,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.green),
        child: Text('This is screen 3',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
// 0xFFE66969
