import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourites_screen.dart';
import '../widgets/main_drawer.dart';
import '../models/meal.dart';


class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedTabIndex=0;

List<Map<String,Object>> _pages;

  void _selectedTab(int index){
    setState(() {
      _selectedTabIndex=index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _pages=[
      {'page':CategoryScreen(),'title':'Categories'},
      {'page': FavouritesScreen(widget.favoriteMeals),'title':'Favourites'}
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:Scaffold(
        appBar: AppBar(
          title: Text('${_pages[_selectedTabIndex]['title']}'),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedTabIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectedTab,
          currentIndex: _selectedTabIndex,
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.category),title: Text('Categories')),
            BottomNavigationBarItem(icon: Icon(Icons.star),title: Text('Favourites'))
          ],
        ),
      ) ,

    );
  }

}
