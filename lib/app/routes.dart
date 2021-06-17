import 'package:flutter/material.dart';
import 'package:helpdesk/net/model/user.dart';
import 'package:helpdesk/ui/details/details.dart';
import 'package:helpdesk/ui/home/home.dart';
import 'package:helpdesk/ui/splash/splash_screen.dart';

/*
  used as the main route generator in the app
  to add new route add new case, if the route
  has some arg, then you should validate them
  for example  if (args is User) { ...
 */
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case "/home":
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case "/details":
      // Validation of correct data type
        if (args is User) {
          return MaterialPageRoute(builder: (_) => DetailsScreen(user: args));
        }
        // If args is not of the correct type, return an error page.
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }

}
