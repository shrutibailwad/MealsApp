import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import './screens/meal_detail_screen.dart';

import './screens/categories_meals_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import 'models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool> _filters={
    'Gluten':false,
    'Lactose':false,
    'Vegetarian':false,
    'Vegan':false
  };



  List<Meal> _availableMeals=DUMMY_MEALS;
  List<Meal> _favoriteMeals=[];

  toggleFavorite(String mealId){

     final existingIndex=_favoriteMeals.indexWhere((meal) => meal.id==mealId);
     if(existingIndex>=0){
       setState(() {
         _favoriteMeals.removeAt(existingIndex);
       });

     }
     else{
       setState(() {
         _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
       });

     }


  }

   isFavorite(String mealId){
   return _favoriteMeals.any((meal) => meal.id==mealId);
  }
   setFilters(Map<String,bool> filterData){
     setState(() {
       _filters=filterData;
       print('Set filters:$_filters');
       _availableMeals=DUMMY_MEALS.where((meal) {
         if(_filters['Gluten'] && !meal.isGlutenFree){

           return false;
         }
         if(_filters['Lactose'] && !meal.isLactoseFree){

           return false;
         }
         if(_filters['Vegetarian'] && !meal.isVegetarian){
           print('In if condition:${_filters['Vegetarian']}');
           return false;
         }
         if(_filters['Vegan'] && !meal.isVegan){

           return false;
         }

           return true;

       }).toList();

     });


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delicious Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1)
          ),
          title: TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
        )
      ),

      //home: CategoryScreen(),
      initialRoute: '/',
      routes:{
        '/':(context)=>TabsScreen(_favoriteMeals),
        CategoriesMealsScreen.routeName:(context)=> CategoriesMealsScreen(_availableMeals),
        MealDetailScreen.routeName:(context)=> MealDetailScreen(isFavorite,toggleFavorite),
        FiltersScreen.routeName:(context)=> FiltersScreen(_filters,setFilters)
      }

    );
  }
}


