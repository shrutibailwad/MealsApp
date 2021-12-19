import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName='/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.isFavorite,this.toggleFavorite);

  Widget buildSectionTitle(BuildContext context,String text){
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text('$text',
        style: Theme.of(context).textTheme.title,),
    );
  }

  Widget buildContainer(Widget child){
    return Container(
        height: 150,
        width: 300,
        padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    border: Border.all(color:Colors.grey)
    ),
    child: child);
  }
  @override
  Widget build(BuildContext context) {
    final mealId=ModalRoute.of(context).settings.arguments as String;
    final selectedMeal=DUMMY_MEALS.firstWhere((meal) => meal.id==mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),

            ),
            child:Image.network(selectedMeal.imageUrl,height: 200,width: double.infinity,fit: BoxFit.cover,)
          ),
          buildSectionTitle(context,'Ingredients'),
         buildContainer(ListView.builder(itemBuilder: (context,index){

             return Card(
               color: Theme.of(context).accentColor,
               child: Padding(
                 padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                 child: Text('${selectedMeal.ingredients[index]}',
                 style: Theme.of(context).textTheme.title,
                 ),
               ),
             );
            },
            itemCount: selectedMeal.ingredients.length,
            ),
          ),
          buildSectionTitle(context,'Steps'),
          buildContainer(
            ListView.builder(itemBuilder: (context,index){
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Text('# ${index+1}'),
                    ),
                    title: Text('${selectedMeal.steps[index]}'),
                  ),
                  Divider()
                ],
              );
            },
            itemCount: selectedMeal.steps.length,)
          ),
          FloatingActionButton(child:
          Icon(isFavorite(mealId)?Icons.star:Icons.star_border_outlined),
              onPressed:()=> toggleFavorite(mealId))
        ],),
      )
    );
  }
}
