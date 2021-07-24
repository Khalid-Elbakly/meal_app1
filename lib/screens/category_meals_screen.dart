import 'package:flutter/material.dart';
import 'package:meal_app1/models/meal.dart';
import 'package:meal_app1/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routename = 'category_meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context).settings.arguments as Map;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            affordability: categoryMeals[index].affordability,
            title: categoryMeals[index].title,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
