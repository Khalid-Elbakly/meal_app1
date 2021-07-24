import 'package:flutter/material.dart';
import 'package:meal_app1/widgets/maindrawer.dart';

class Filters_Screen extends StatefulWidget {
  static const routename = "/filters_screen";
  Map<String, bool> filters;
  Function setFilters;

  Filters_Screen(this.filters, this.setFilters);

  @override
  _Filters_ScreenState createState() => _Filters_ScreenState();
}

class _Filters_ScreenState extends State<Filters_Screen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  @override
  void initState() {
    isGlutenFree = widget.filters['GlutenFree'];
    isLactoseFree = widget.filters["LactoseFree"];
    isVegan = widget.filters["isVegan"];
    isVegetarian = widget.filters["isVegetarian"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: () {
          final selectedFilters = {
            "GlutenFree": isGlutenFree,
            "LactoseFree": isLactoseFree,
            "isVegan": isVegan,
            "isVegetarian": isVegetarian
          };

          widget.setFilters(selectedFilters);
        })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Column(
          children: [
            Text(
              "Adjust your meal selection",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            Expanded(
                child: ListView(children: [
                  SwitchListTile(
                    title: Text("GlutenFree"),
                    subtitle: Text("only include gluten free meals"),
                    value: isGlutenFree,
                    onChanged: (value) {
                      setState(() {
                        isGlutenFree = value;
                      });
                    },
                    activeColor: Colors.orangeAccent,
                  ),
                  SwitchListTile(
                    title: Text("LactoseFree"),
                    subtitle: Text("only include lactose free meals"),
                    value: isLactoseFree,
                    onChanged: (value) {
                      setState(() {
                        isLactoseFree = value;
                      });
                    },
                    activeColor: Colors.orangeAccent,
                  ),
                  SwitchListTile(
                    title: Text("is Vegan"),
                    subtitle: Text("only include vegan meals"),
                    value: isVegan,
                    onChanged: (value) {
                      setState(() {
                        isVegan = value;
                      });
                    },
                    activeColor: Colors.orangeAccent,
                  ),
                  SwitchListTile(
                    title: Text("isVegetarian"),
                    subtitle: Text("only include vegetarian meals"),
                    value: isVegetarian,
                    onChanged: (value) {
                      setState(() {
                        isVegetarian = value;
                      });
                    },
                    activeColor: Colors.orangeAccent,
                  ),
                ]))
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
