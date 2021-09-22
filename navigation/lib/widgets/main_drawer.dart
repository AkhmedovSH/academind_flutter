import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(
      BuildContext context, String title, IconData icon, String routeName) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () => {
        if (routeName == '/')
          {
            Navigator.of(context).pushReplacementNamed('/'),
          },
        if (routeName == '/filters')
          {
            Navigator.of(context).pushReplacementNamed('/filters'),
          }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(context, 'Meals', Icons.restaurant, '/'),
          buildListTile(context, 'Filters', Icons.settings, '/filters'),
        ],
      ),
    );
  }
}
