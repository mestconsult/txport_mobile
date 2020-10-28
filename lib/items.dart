import 'package:flutter/material.dart';

class Catalog extends StatefulWidget {
  final String title;
  Catalog({Key key, this.title}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return itemsPage();
  }

  Widget catalogScreen() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.separated(
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: _catalogItemBuilder,
      ),
    );
  }

  Widget _catalogItemBuilder(BuildContext context, int index) {
    return ListTile(
      title: Text('Item ${index + 1}', style: TextStyle(fontSize: 18)),
      trailing: TextButton(child: Text('ADD')),
    );
  }

  Widget itemsPage() {
    return GridView.builder(
      primary: false,
      padding: const EdgeInsets.all(0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        crossAxisCount: 1,
      ),
      itemCount: 30,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            padding: const EdgeInsets.all(8),
            child: Card(
              elevation: 20,
              child: Column(
                children: [
                  Image(
                    image: AssetImage('images/cat1.jpg'),
                  ),
                  Text('Product Name'),
                  Text('Price'),
                  Expanded(child: Text('Item Quantity')),
                  Expanded(
                      child: TextButton(onPressed: null, child: Text('ADD')))
                ],
              ),
            ));
      },
    );
  }
}
