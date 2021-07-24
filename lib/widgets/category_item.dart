import 'package:flutter/material.dart';
import 'package:meal_app1/screens/category_meals_screen.dart';

class Category_item extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const Category_item(this.id, this.title, this.color);

  void selectCategory (BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routename,
    arguments: {
      'id' : id,
      'title' : title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){selectCategory(context);},
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [color.withOpacity(0.7),color],begin: Alignment.topLeft,end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(title,style: Theme.of(context).textTheme.bodyText1,),
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
