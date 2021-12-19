import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meals_item.dart';

class CategoriesMealsScreen extends StatefulWidget {
static const routeName='/category-meals';
final List<Meal> availableMeals;

CategoriesMealsScreen(this.availableMeals);
  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
List<Meal> categoryMeals;
String categoryTitle;
var _loadIntData=false;


 _removeMeal(String mealId){
  setState(() {
    categoryMeals.removeWhere((meal) => meal.id==mealId);
  });
 }

 @override
  void didChangeDependencies() {
   if(!_loadIntData) {
     final routeArgs = ModalRoute
         .of(context)
         .settings
         .arguments as Map<String, String>;
     categoryTitle = routeArgs['title'];
     final categoryId = routeArgs['id'];
     categoryMeals = widget.availableMeals.where((meal) {
       return meal.categories.contains(categoryId);
     }).toList();
     _loadIntData=true;
   }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return MealsItem(id:categoryMeals[index].id,
          title:categoryMeals[index].title,
        imageUrl:categoryMeals[index].imageUrl,
        duration: categoryMeals[index].duration,
        complexity: categoryMeals[index].complexity,
        affordability: categoryMeals[index].affordability,
        removeItem: _removeMeal);
      },
      itemCount: categoryMeals.length,)
    );
  }
}
