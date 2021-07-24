import 'package:flutter/material.dart';
import 'package:meal_app1/models/meal.dart';
import 'package:meal_app1/screens/categories_screen.dart';
import 'package:meal_app1/screens/favourite_screen.dart';
import 'package:meal_app1/widgets/maindrawer.dart';

class Tabs_Screen extends StatefulWidget {
  List<Meal> favouriteMeals;
  Tabs_Screen(this.favouriteMeals);



  @override
  _Tabs_ScreenState createState() => _Tabs_ScreenState();
}

class _Tabs_ScreenState extends State<Tabs_Screen> {
  List<Map<String, Object>> setpage;

  int _selectedpageIndex = 0;

  @override
  initState(){
    setpage = [
      {
        "page": CategoriesScreen(),
        "title": "Categories",
      },
      {
        "page": Favourite_Screen(widget.favouriteMeals),
        "title": "My Favourites"
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(setpage[_selectedpageIndex]["title"]),
        ),
        body: setpage[_selectedpageIndex]["page"],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selected_tabs,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedpageIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category_sharp),
              label: "Categories",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.favorite),
            label: "Favourites",)
          ],
        ),
      drawer: MainDrawer(),
    );
  }

  void _selected_tabs(int value) {
    setState(() {
      _selectedpageIndex = value;
    });
  }
}
