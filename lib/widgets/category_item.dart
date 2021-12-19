import 'package:flutter/material.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;


  CategoryItem(this.id,this.title, this.color);


  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoriesMealsScreen.routeName,
        arguments: {'id':id,'title':title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme
          .of(context)
          .primaryColor,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,
          style: Theme
              .of(context)
              .textTheme
              .title,),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  color.withOpacity(0.7),
                  color
                ])
        ),

      ),
    );
  }

}

