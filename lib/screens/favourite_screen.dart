import 'package:flutter/material.dart';
import 'package:meal_app1/models/meal.dart';
import 'package:meal_app1/widgets/meal_item.dart';

    class Favourite_Screen extends StatefulWidget {
      static const routename = 'favourite_screen';

      List<Meal> favouriteMeals;

  Favourite_Screen(this.favouriteMeals);

  @override
  _Favourite_ScreenState createState() => _Favourite_ScreenState();
}

class _Favourite_ScreenState extends State<Favourite_Screen> {
      @override
      Widget build(BuildContext context) {
        if(widget.favouriteMeals.isEmpty){
          return Center(child: Text("You have not added any favourite mael yet \n start adding some!",textAlign: TextAlign.center,),);
        }else
        return Scaffold(
          body: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: widget.favouriteMeals[index].id,
                imageUrl: widget.favouriteMeals[index].imageUrl,
                complexity: widget.favouriteMeals[index].complexity,
                duration: widget.favouriteMeals[index].duration,
                affordability: widget.favouriteMeals[index].affordability,
                title: widget.favouriteMeals[index].title,
              );
            },
            itemCount: widget.favouriteMeals.length,
          ),
        );
      }
}
