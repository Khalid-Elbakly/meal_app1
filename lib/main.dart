import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app1/dummy_data.dart';
import 'package:meal_app1/screens/category_meals_screen.dart';
import 'package:meal_app1/screens/favourite_screen.dart';
import 'package:meal_app1/screens/filters_screen.dart';
import 'package:meal_app1/screens/meal_detail_screen.dart';
import 'package:meal_app1/screens/tabs_screen.dart';

import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> Filters = {
    'GlutenFree': false,
    'LactoseFree': false,
    'isVegan': false,
    'isVegetarian': false
  };

  List<Meal> availableMeals = DUMMY_MEALS;

  List<Meal> favouriteMeals = [];

  void setFilters(Map<String, bool> FiltersData) {
    setState(() {
      Filters = FiltersData;

      availableMeals = DUMMY_MEALS.where((meal) {
        if (Filters["GlutenFree"] && !meal.isGlutenFree) return false;
        if (Filters["LactoseFree"] && !meal.isLactoseFree) return false;
        if (Filters["isVegan"] && !meal.isVegan) return false;
        if (Filters["isVegetarian"] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void toggleFavourite(String mealId) {
    final exitingIndex = favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if (exitingIndex >= 0) {
      setState(() {
        favouriteMeals.removeAt(exitingIndex);
      });
    } else {
      setState(() {
        favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavourite(String mealId){
    return favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
      ),
      // home: MyHomePage(title: "Meal App"),
      routes: {
        '/': (context) => Tabs_Screen(favouriteMeals),
        CategoryMealsScreen.routename: (context) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routename: (context) =>
            MealDetailScreen(toggleFavourite,isMealFavourite),
        Filters_Screen.routename: (context) =>
            Filters_Screen(Filters, setFilters),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: null);
  }
}
