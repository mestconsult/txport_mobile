import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/items.dart';
import 'package:flutter_playground/screen_four.dart';
import 'package:flutter_playground/screen_one.dart';
import 'package:flutter_playground/screen_three.dart';
import 'package:flutter_playground/screen_two.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  /// For Tabs and TabView
  /// DefaultTabController(length: 3, child: MyHomePage(title: 'Demo'))

  @override
  Widget build(BuildContext context) {
    final homePage = MyHomePage(title: 'Examples');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Demo'), //MyHomePage(title: 'Examples'),
    );
  }
  // Catalog(title: 'Catalog')

  Widget bottomNavigationBarExample(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      currentIndex: 0,
      items: _bottomBarElements,
      onTap: (index) => {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            elevation: 10,
            content: Text('Index tapped: $index'),
          ),
        )
      },
    );
  }

  final _bottomBarElements = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.developer_mode),
      label: 'Technology',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mode_comment),
      label: 'Pitching',
    ),
  ];
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10'
  ];
  final String title;
  final screens = {
    // key: // value
    '/screen_1': (_) => DemoScreen(title: 'Screen One'),
    '/screen_2': (_) => DemoScreenTwo(title: 'Screen Two'),
    '/screen_3': (_) => DemoScreenThree(title: 'Screen Three'),
    '/screen_4': (_) => DemoScreenFour(title: 'Screen Four'),
  };

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final emailFieldController = TextEditingController();
  final passwordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return drawerExample();
  }

  Widget navigationExample() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          showTextButton(
              buttonTitle: 'Go To Screen 1',
              onTapListener: () => moveToScreen('/screen_1')),
          showTextButton(
              buttonTitle: 'Go To Screen 2',
              onTapListener: () => moveToScreen('/screen_2')),
          showTextButton(
              buttonTitle: 'Go To Screen 3',
              onTapListener: () => moveToScreen('/screen_3')),
          showTextButton(
              buttonTitle: 'Go To Screen 4',
              onTapListener: () => moveToScreen('/screen_4')),
        ],
      ),
    );
  }

  Widget bottomNavigationBarExample(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Bottom Navigation Bar Example'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        currentIndex: 0,
        items: _bottomBarElements,
        onTap: (index) => {
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(
              elevation: 10,
              content: Text('Index tapped: $index'),
            ),
          )
        },
      ),
    );
  }

  final _bottomBarElements = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.developer_mode),
      label: 'Technology',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.mode_comment),
      label: 'Pitching',
    ),
  ];

  Widget drawerExample() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Drawer Example')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              child: ListTile(
                leading: Icon(Icons.developer_mode),
                title: Text('Navigation and Routing'),
              ),
              onTap: () {
                Navigator.of(context).pop();
                moveToScreen('/screen_1');
              },
            ),
            ListTile(
              leading: Icon(Icons.apps_sharp),
              title: Text('Adding Interactivity'),
            ),
            ListTile(
              leading: Icon(Icons.stacked_line_chart),
              title: Text('State Management'),
            ),
            ListTile(
              leading: Icon(Icons.web),
              title: Text('Web Development'),
            ),
            ListTile(
              leading: Icon(Icons.mobile_friendly),
              title: Text('Mobile Development'),
            ),
          ],
        ),
      ),
      body: loginForm(),
    );
  }

//  Center(
//  child: TextButton(
//  child: Text('Show Drawer'),
//  onPressed: () => _scaffoldKey.currentState.openDrawer(),
//  ),
//  ),
  void moveToScreen(String routeName) {
    dynamic destination = widget.screens[routeName];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: destination,
      ),
    );
    //Navigator.of(_scaffoldKey.currentContext).pushNamed(routeName);
  }

  /// TabBar and TabBarView
  Widget tabsExample(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabs Example'),
        bottom: TabBar(
          tabs: [
            Tab(text: 'INBOX', icon: Icon(Icons.inbox)),
            Tab(text: 'UNREAD', icon: Icon(Icons.mark_as_unread)),
            Tab(text: 'SENT', icon: Icon(Icons.send_outlined)),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          Center(child: Text('ALL INBOX')),
          Center(child: Text('UNREAD')),
          Center(child: Text('SENT')),
        ],
      ),
    );
  }

  /// Code examples for UI found

  TextButton showTextButton({String buttonTitle, Function onTapListener}) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(10)),
        minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
            MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
      ),
      child: Text(buttonTitle),
      onPressed: onTapListener,
    );
  }

  Widget textButtonExample(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Button'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: showTextButton(
            buttonTitle: 'Button', onTapListener: _showAlertDialog(context)),
      ),
    );
  }

  Widget scaffoldWithAppBar() => Scaffold(
        appBar: AppBar(
          title: Text('AppBar Demo'),
          actions: [Icon(Icons.add_alert), Icon(Icons.navigate_next)],
        ),
        body: Center(child: Text('Your page content here')),
      );

  Widget buildListViewWithChildren() {
    return ListView(
      children: widget.items
          .map(
            (e) => ListTile(
              title: Text(e),
              leading: IconButton(
                onPressed: null,
                icon: Icon(Icons.account_box),
              ),
              trailing: IconButton(
                onPressed: null,
                icon: Icon(Icons.navigate_next),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildListWithBuilder() {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Title $index'),
          );
        });
  }

  Widget buildListWithSeparator() {
    return ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) =>
            ListTile(title: Text('Item $index')));
  }

  Widget demoRow() {
    return Container(
      color: Colors.lightBlue,
      child: Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            image: AssetImage(
              'images/cat1.jpg',
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              image: AssetImage('images/cat2.jpg'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            width: 100,
            height: 100,
            fit: BoxFit.cover,
            image: AssetImage('images/cat3.jpg'),
          ),
        ),
      ]),
    );
  }

  Widget cardExample() {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Container(
            width: 300,
            height: 100,
            child: Text('A card that can be tapped'),
          ),
        ),
      ),
    );
  }

  Widget cardElaborateExample() {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => bottomSheetContent(),
    );
  }

  Widget bottomSheetContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(Icons.share_outlined),
          title: Text('Share'),
        ),
        ListTile(
          leading: Icon(Icons.link),
          title: Text('Get link'),
        ),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Edit name'),
        ),
        ListTile(
          leading: Icon(Icons.delete),
          title: Text('Delete collection'),
        ),
      ],
    );
  }

  _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => AlertDialog(
        title: Text('Mobile Development with Flutter'),
        content: Text(
            'This class requires a lot of attention and commitment. Are you ready to learn?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Yes'),
          )
        ],
      ),
    );
  }

  Widget checkboxExample() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Example'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text('Checkbox 1'),
              Checkbox(
                value: true,
                onChanged: (bool value) {
                  log('Checkbox value changed, $value');
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('Checkbox 2'),
              Checkbox(
                value: false,
                onChanged: (bool value) {
                  log('Checkbox value changed, $value');
                },
              ),
            ],
          ),
          Row(
            children: [
              Text('Checkbox 3'),
              Checkbox(
                value: false,
                onChanged: (bool value) {
                  log('Checkbox value changed, $value');
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomSheetExample(BuildContext context) {
    log('What is in a context ${context.widget}');
    return Center(
      child: Container(
        child: showTextButton(
            buttonTitle: 'Button', onTapListener: _showBottomSheet(context)),
      ),
    );
  }

// This example shows a [Form] with one [TextFormField] to enter an email
// address and an [ElevatedButton] to submit the form. A [GlobalKey] is used here
// to identify the [Form] and validate input.
  Widget loginForm() {
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: emailFieldController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (value) =>
                      (value.isEmpty) ? 'Please enter your email' : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: TextFormField(
                  controller: passwordFieldController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (value) =>
                      (value.isEmpty) ? 'Please enter your password' : null,
                ),
              ),
              ElevatedButton(
                onPressed: () => handleSubmit(),
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  handleSubmit() {
    if (_formKey.currentState.validate()) {
      // Process data.
      final email = emailFieldController.text;
      final pass = passwordFieldController.text;
      log('Form is valid. Proceed to log in:: $email $pass');
    }
  }

  Widget _buildGridViewWithCountConstructor() {
    return GridView.count(
      primary: false,
      padding: EdgeInsets.all(10),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      crossAxisCount: 2,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text("What is Lorem Ipsum?"),
          color: Colors.teal[100],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Why do we use it?'),
          color: Colors.teal[200],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Where does it come from?'),
          color: Colors.teal[300],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Where can I get some?'),
          color: Colors.teal[400],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Lorem ipsum dolor sit amet, consectetur'),
          color: Colors.teal[500],
        ),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('Donec adipiscing tristique risus'),
          color: Colors.teal[600],
        ),
      ],
    );
  }

  Widget _buildGridViewWithBuilder() {
    return GridView.builder(
      primary: false,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 2,
      ),
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(8),
          color: Colors.blueGrey[200],
          child: Center(
              child: Text(
            "Item ${index + 1}",
            style: TextStyle(fontSize: 16),
          )),
        );
      },
    );
  }
}
