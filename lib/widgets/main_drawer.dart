import 'dart:ffi';

import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String text,IconData icon,Function functionHandler){
    return ListTile(
      leading: Icon(icon,
        size: 26,),
      title: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          fontFamily: 'Roboto Condensed',
        ),),
      onTap: functionHandler,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).accentColor,
            child: Text('Cooking Up!!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor
            ),),
          ),
          SizedBox(
            height: 20,
          ),
         buildListTile('Meals', Icons.restaurant,
             (){
           Navigator.of(context).pushReplacementNamed('/');
             }),
          buildListTile('Filters', Icons.settings,
              (){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName,);
              })
        ],
      ),
    );
  }
}
