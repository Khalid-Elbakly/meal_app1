import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: EdgeInsets.all(10),
          children: DUMMY_CATEGORIES.map((catDummy) => Category_item(catDummy.id,catDummy.title,catDummy.color)).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 1.5,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15
      ),
    )
    );
  }
}
