import 'package:flutter/material.dart';
import 'package:meal_app1/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routename = "meal_detail";
  Function toggleFavourite;
  Function isFavourite;

  MealDetailScreen(this.toggleFavourite,this.isFavourite);

  buildContainer(Widget widget) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      width: 300,
      height: 150,
      child: widget,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "Ingredients",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              buildContainer(
                  ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.amberAccent,
                      child: Text(
                        meal.ingredients[index],
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    );
                  },
                  itemCount: meal.ingredients.length,
                ),
              ),
              Text(
                "Steps",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              buildContainer(
                ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text("${index + 1}"),
                        ),
                        title: Text(meal.steps[index]),
                      );
                    },
                    itemCount: meal.steps.length),
              )
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavourite(mealId) ? Icons.favorite : Icons.favorite_border_outlined ),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
