import 'package:flutter/material.dart';
import './screens/meal_detail.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';

import './transition/slide_route.dart';

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
      // routes: {
      //   '/': (context) => CategoriesScreen(),
      //   '/category-meals': (context) => CategoryMealsScreen(),
      //   '/meal-detail': (context) => MealDetail(),
      // },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return SlideLeftRoute(
              page: CategoriesScreen(),
            );
          case '/category-meals':
            return SlideLeftRoute(
              page: CategoryMealsScreen(),
              settings: settings,
            );
          case '/meal-detail':
            return SlideLeftRoute(
              page: MealDetail(),
              settings: settings,
            );
          default:
            return null;
        }
      },
    );
  }
}
