import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOKO ONLINE ',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class Item {
  final String imageUrl;
  final String name;
  final String description;

  Item(this.imageUrl, this.name, this.description);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TOKO ONLINE'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
            ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  //1
  Item(
    "https://i.postimg.cc/7YR1mvrK/id-galaxy-z-fold3-f926-5g-406785-sm-f926bzkmxid-thumb-530350483.webp",
    "Samsung Galaxy Z Fold3 5G",
    "Rp 10.859.000 ",
  ),
  //2
  Item(
    "https://i.postimg.cc/WpHJPMY3/Samsung-Galaxy-M53-5-G.webp",
    "Samsung Galaxy M53 5G",
    "Rp 6.299.000",
  ),
  //3
  Item(
    "https://i.postimg.cc/G29hMfCj/Samsung-Galaxy-M33-5-G.webp",
    "Samsung Galaxy M33 5G",
    "Rp 3.999.000",
  ),
  //4
  Item(
    "https://i.postimg.cc/yN8ZHvKD/samsung-galaxy-a73-5g.webp",
    "Samsung Galaxy a73 5G",
    "Rp 7.799.000",
  ),
  //5
  Item(
    "https://i.postimg.cc/T3YwL14S/Samsung-Galaxy-A33-5-G.webp",
    "Samsung Galaxy A33 5G",
    "Rp 4.499.000",
  ),
  //6
  Item(
    "https://i.postimg.cc/Ls3NyyTh/samsung-galaxy-a23-1.webp",
    "Samsung Galaxy a23",
    "Rp 3.499.000",
  ),
  //7
  Item(
    "https://i.postimg.cc/CK7sCRhq/Galaxy-A13-4-G.webp",
    "Samsung Galaxy A13 4G",
    "Rp 4.499.000",
  ),
  //8
  Item(
    "https://i.postimg.cc/52q5n05b/Samsung-Galaxy-A53-5-G.webp",
    "Samsung Galaxy A53 5G",
    "Rp 5.999.000",
  ),
  //9
  Item(
    "https://i.postimg.cc/JhFsqVFR/Samsug-Galaxy-S22-Ultra-5-G-Burgundy.webp",
    "Samsung Galaxy S22 Ultra 5G",
    "Rp 17.999.000",
  ),
  //10
  Item(
    "https://i.postimg.cc/CK9K8CZ1/Samsung-Galaxy-S22-1.webp",
    "Samsung Galaxy S22",
    "Rp 11.999.000",
  ),
];
