import 'package:flutter/material.dart';

class DemoScreen extends StatefulWidget {
  final String title;
  DemoScreen({Key key, this.title}) : super(key: key);

  @override
  _DemoScreenState createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00347C),
        elevation: 20,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: const Color(0xFF00347C)),
        child: Text(
          'This is screen 1',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
