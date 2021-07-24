import 'package:flutter/material.dart';
import 'package:meal_app1/models/meal.dart';
import 'package:meal_app1/widgets/meal_item.dart';

    class Favourite_Screen extends StatelessWidget {
      static const routename = 'favourite_screen';

      List<Meal> favouriteMeals;

  Favourite_Screen(this.favouriteMeals);
      @override
      Widget build(BuildContext context) {
        if(favouriteMeals.isEmpty){
          return Center(child: Text("You have not added any favourite mael yet \n start adding some!",textAlign: TextAlign.center,),);
        }else
        return Scaffold(
          body: ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                id: favouriteMeals[index].id,
                imageUrl: favouriteMeals[index].imageUrl,
                complexity: favouriteMeals[index].complexity,
                duration: favouriteMeals[index].duration,
                affordability: favouriteMeals[index].affordability,
                title: favouriteMeals[index].title,
              );
            },
            itemCount: favouriteMeals.length,
          ),
        );
      }
    }
