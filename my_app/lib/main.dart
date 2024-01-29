import 'package:flutter/material.dart';
import 'slambook_route.dart';
import 'friends_route.dart';
import 'ScreenArguments.dart';
import 'SummaryArguments.dart';
import 'description_route.dart';
import 'initial_route.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: InitialRoute(),
    routes: {
    },
    onGenerateRoute: (settings) {;
      if (settings.name == FriendsRoute.routename) {
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(builder: (context) {
          return FriendsRoute(title: args.title, message: args.message);
        });
      }
      else if (settings.name == DescriptionRoute.routename) {
        final args = settings.arguments as SummaryArguments;
        return MaterialPageRoute(builder: (context) {
          return DescriptionRoute(title: args.title, message: args.message);
        });
      }
      else if (settings.name == SlambookRoute.routename) {
        return MaterialPageRoute(builder: (context) {
          return SlambookRoute();
        });
      }
      return null;
    },
  ));
}
