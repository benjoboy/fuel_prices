import 'package:flutter/material.dart';
import 'package:fuel_prices/widgets/drawer_item.dart';
import 'package:fuel_prices/widgets/fuel_prices.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const drawerItems = [
    DrawerItem("Prices", Icons.rss_feed),
    DrawerItem("Calculator", Icons.calculate),
  ];

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const FuelPrices();
      default:
        return const Text('Error');
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < HomePage.drawerItems.length; i++) {
      var d = HomePage.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(
            title: Text(HomePage.drawerItems[_selectedDrawerIndex].title),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Drawer Header'),
                ),
                Column(children: drawerOptions)
              ],
            ),
          ),
          body: _getDrawerItemWidget(_selectedDrawerIndex),
        ),
        onWillPop: () async {
          return true;
        });
  }
}
