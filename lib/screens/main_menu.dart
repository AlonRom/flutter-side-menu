import 'package:flutter/material.dart';
import 'package:flutter_side_menu/models/infra/menu_item.dart';
import 'package:flutter_side_menu/screens/bugs.dart';
import 'package:flutter_side_menu/screens/cats.dart';
import 'package:flutter_side_menu/screens/cows.dart';
import 'package:flutter_side_menu/screens/dashboard.dart';
import 'package:flutter_side_menu/screens/dogs.dart';
import 'package:flutter_side_menu/screens/dolphins.dart';
import 'package:flutter_side_menu/screens/doves.dart';
import 'package:flutter_side_menu/screens/elephants.dart';
import 'package:flutter_side_menu/screens/fishes.dart';

class MainMenu extends StatefulWidget {
  @override
  MainMenuState createState() {
    return MainMenuState();
  }
}

class MainMenuState extends State<MainMenu> {
  Widget _appBarTitle;
  Color _appBarBackgroundColor;
  MenuItem _selectedMenuItem;
  List<MenuItem> _menuItems;
  List<Widget> _menuOptionWidgets = [];

  @override
  initState() {
    super.initState();

    _menuItems = createMenuItems();
    _selectedMenuItem = _menuItems.first;
    _appBarTitle = new Text(_menuItems.first.title);
    _appBarBackgroundColor = _menuItems.first.color;
  }

  _getMenuItemWidget(MenuItem menuItem) {
    return menuItem.func();
  }

  _onSelectItem(MenuItem menuItem) {
    setState(() {
      _selectedMenuItem = menuItem;
      _appBarTitle = new Text(menuItem.title);
      _appBarBackgroundColor = menuItem.color;
    });
    Navigator.of(context).pop(); // close side menu
  }

  @override
  Widget build(BuildContext context) {
    _menuOptionWidgets = [];

    for (var menuItem in _menuItems) {
      _menuOptionWidgets.add(new Container(
          decoration: new BoxDecoration(
              color: menuItem == _selectedMenuItem
                  ? Colors.grey[200]
                  : Colors.white),
          child: new ListTile(
              leading: new Image.asset(menuItem.icon),
              onTap: () => _onSelectItem(menuItem),
              title: Text(
                menuItem.title,
                style: new TextStyle(
                    fontSize: 20.0,
                    color: menuItem.color,
                    fontWeight: menuItem == _selectedMenuItem
                        ? FontWeight.bold
                        : FontWeight.w300),
              ))));

      _menuOptionWidgets.add(
        new SizedBox(
          child: new Center(
            child: new Container(
              margin: new EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
              height: 0.3,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: _appBarTitle,
        backgroundColor: _appBarBackgroundColor,
        centerTitle: true,
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new Container(
                child: new ListTile(
                    leading: new Image.asset('assets/images/lion.png'),
                    title: Text("romalon1@gmail.com")),
                margin: new EdgeInsetsDirectional.only(top: 20.0),
                color: Colors.white,
                constraints: BoxConstraints(maxHeight: 90.0, minHeight: 90.0)),
            new SizedBox(
              child: new Center(
                child: new Container(
                  margin:
                      new EdgeInsetsDirectional.only(start: 10.0, end: 10.0),
                  height: 0.3,
                  color: Colors.black,
                ),
              ),
            ),
            new Container(
              color: Colors.white,
              child: new Column(children: _menuOptionWidgets),
            ),
          ],
        ),
      ),
      body: _getMenuItemWidget(_selectedMenuItem),
    );
  }

  List<MenuItem> createMenuItems() {
    final menuItems = [
      new MenuItem("Dashboard", 'assets/images/dashboard.png', Colors.black, () => new Dashboard()),
      new MenuItem("Cows", 'assets/images/cow.png', Colors.green, () => new Cows()),
      new MenuItem("Doves", 'assets/images/dove.png', Colors.yellow, () => new Doves()),
      new MenuItem("Dogs", 'assets/images/dog.png', Colors.brown, () => new Dogs()),
      new MenuItem("Dolphins", 'assets/images/dolphin.png', Colors.orange, () => new Dolphins()),
      new MenuItem("Bugs", 'assets/images/bug.png', Colors.red, () => new Bugs()),
      new MenuItem("Cats", 'assets/images/cat.png', Colors.purple, () => new Cats()),
      new MenuItem("Fishes", 'assets/images/fish.png', Colors.blue, () => new Fishes()),
      new MenuItem("Elephants", 'assets/images/elephant.png', Colors.grey, () => new Elephants()),
    ];
    return menuItems;
  }
}
