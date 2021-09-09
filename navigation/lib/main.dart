import 'package:flutter/material.dart';
import 'package:navigation/categories_screen.dart';
import 'package:navigation/category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        textTheme: ThemeData.light().textTheme.copyWith( 
            bodyText1: TextStyle(
              color: Colors.black,
            ),
            bodyText2: TextStyle(
              color: Colors.black,
            ),
            headline1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      ),
      routes: {
        '/': (context) => CategoriesScreen(),
        '/category-meals': (context) => CategoryMealsScreen(),
      },
    );
  }
}
