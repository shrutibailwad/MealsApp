import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meals_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavouritesScreen(this.favoriteMeals);


  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty)
    return Container(
      child: Center(
        child:Text('You dont have any favorites..Please start adding!!')
      ),
    );
    else
      return ListView.builder(itemBuilder: (context,index){
        return MealsItem(id:favoriteMeals[index].id,
            title:favoriteMeals[index].title,
            imageUrl:favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
        );
      },
        itemCount: favoriteMeals.length,);
  }
}
