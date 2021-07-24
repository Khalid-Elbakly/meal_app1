import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app1/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  BuldListTile(IconData icon, String title, Function Tap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 36,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
      ),
      onTap: Tap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: [
      Container(
        height: 200,
        width: 300,
        color: Colors.yellowAccent,
        alignment: Alignment.centerLeft,
        child: Text("Cooking Up!",style: TextStyle(color: Colors.black,fontSize: 30),),
      ),
      BuldListTile(Icons.set_meal, "Meals", () {
        Navigator.of(context).pushNamed('/');
      }),
      BuldListTile(Icons.filter_alt_sharp, "Filters", () {
        Navigator.of(context).pushNamed(Filters_Screen.routename);
      })
    ]));
  }
}
