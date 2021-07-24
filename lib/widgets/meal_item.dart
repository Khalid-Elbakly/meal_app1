import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app1/models/meal.dart';
import 'package:meal_app1/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final Affordability affordability;
  final Complexity complexity;
  final String imageUrl;
  final int duration;

  const MealItem({
    @required this.id,
    @required this.title,
    @required this.affordability,
    @required this.complexity,
    @required this.imageUrl,
    @required this.duration,
  });

  String complexityText() {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
      case Complexity.Challenging:
        return "Challenging";
      case Complexity.Hard:
        return "Hard";
      default:
        "Unknown";
    }
  }

  String AffordabilityText() {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
      case Affordability.Luxurious:
        return "Luxurious";
      case Affordability.Pricey:
        return "Pricey";
      default:
        "Unknown";
    }
  }

  selectmeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailScreen.routename,
    arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        elevation: 5,
        child: Column(
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(imageUrl),
              ),
              Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ))
            ]),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexityText())
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(AffordabilityText())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
