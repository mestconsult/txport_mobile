import 'package:flutter/material.dart';

class DemoScreenFour extends StatefulWidget {
  final String title;
  DemoScreenFour({Key key, this.title}) : super(key: key);

  @override
  _DemoScreenFourState createState() => _DemoScreenFourState();
}

class _DemoScreenFourState extends State<DemoScreenFour> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 20,
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.amber),
        child: Text('This is screen 4',
            style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}
