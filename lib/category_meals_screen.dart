import 'package:flutter/material.dart';

import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId, categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryTitle = routeArgs['title'];
    final String categoryID = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryID);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return Text(meal.title);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
