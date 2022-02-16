import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen();
  final routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routerArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routerArgs['id'];
    final categoryTitle = routerArgs['title'] as String;

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Container(
        child: const Text("Hello"),
      ),
    );
  }
}
