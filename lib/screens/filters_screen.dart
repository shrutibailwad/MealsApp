import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName='/filters';
  final Function saveFilters;
   Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool GlutenFree=false;
  bool LactoseFree=false;
  bool Vegetarian=false;
  bool Vegan=false;

  Widget buildSwitchFilters(String text,String subText,bool value,Function newValue){
    return Expanded(child: SwitchListTile(
      title: Text(text),
      subtitle: Text(subText),
      value: value,
      onChanged: newValue,
    ));
  }

  @override
  void initState() {
    GlutenFree=widget.currentFilters['Gluten'];
    LactoseFree=widget.currentFilters['Lactose'];
    Vegetarian=widget.currentFilters['Vegetarian'];
    Vegan=widget.currentFilters['Vegan'];

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed:(){
            final selectedFilters={
              'Gluten':GlutenFree,
              'Lactose':LactoseFree,
              'Vegetarian': Vegetarian,
              'Vegan':Vegan
            };
            print('filter selected:$selectedFilters');
            widget.saveFilters(selectedFilters);
          })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Text('Please set your filters!!',
            style: Theme.of(context).textTheme.title,
            textAlign: TextAlign.center,
            )
          ),
       buildSwitchFilters('Gluten Free', 'Includes all gluten free meals', GlutenFree, (newValue){
         setState(() {
           GlutenFree=newValue;
         });
       }),
          buildSwitchFilters('Lactose Free', 'Includes all lactose free meals', LactoseFree, (newValue){
            setState(() {
              LactoseFree=newValue;
            });
          }),
          buildSwitchFilters('Vegetarian', 'Includes all vegetarian meals', Vegetarian, (newValue){
            setState(() {
              Vegetarian=newValue;
            });
          }),
          buildSwitchFilters('Vegan', 'Includes all vegan meals', Vegan, (newValue){
            setState(() {
              Vegan=newValue;
            });
          }),
        ],
      ),
    );
  }
}
