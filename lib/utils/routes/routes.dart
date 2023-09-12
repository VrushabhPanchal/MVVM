

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/Home_View.dart';
import 'package:mvvm/view/Login_View.dart';
import 'package:mvvm/view/Signup_View.dart';
import 'package:mvvm/view/Splash_View.dart';

class Routes {

  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginView(),);
      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeView(),);
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const SignUpView(),);
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashView(),);

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        }
        );
    }

  }


}