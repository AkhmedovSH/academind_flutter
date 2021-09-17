import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/meal_detail_screen.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './models/meal.dart';

import './transition/slide_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegatarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters['gluten']! && element.isGlutenFree!) {
          return false;
        }
        if (_filters['lactose']! && !element.isLactoseFree!) {
          return false;
        }
        if (_filters['vegan']! && !element.isVegan!) {
          return false;
        }
        if (_filters['vegatarian']! && !element.isVegetarian!) {
          return false;
        }
        return true;
      }).toList();
    });
  }

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
              ),
            ),
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
              page: TabsScreen(),
            );
          case '/category-meals':
            return SlideLeftRoute(
              page: CategoryMealsScreen(_availableMeals),
              settings: settings,
            );
          case '/meal-detail':
            return SlideLeftRoute(
              page: MealDetailScreen(),
              settings: settings,
            );
          case '/filters':
            return SlideLeftRoute(
              page: FiltersScreen(_setFilters),
              settings: settings,
            );
          default:
            return null;
        }
      },
    );
  }
}
