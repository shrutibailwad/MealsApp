import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(20),
          children:
    DUMMY_CATEGORIES.map((catData) =>
        CategoryItem(catData.id,catData.title,catData.color)).toList(),
        gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3/2,
          maxCrossAxisExtent: 200
        ));
  }
}
