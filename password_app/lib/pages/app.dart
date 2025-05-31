import 'package:flutter/material.dart';
import 'package:password_app/config/app_routes.dart';
import 'package:password_app/design/password_app_theme.dart';
import 'package:password_app/pages/home_page.dart';
import 'package:password_app/pages/login_page.dart';
import 'package:password_app/pages/new_page.dart';
import 'package:password_app/pages/other_page.dart';

import '../models/user.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: PasswordAppTheme.defaulTheme,
      //Navegacion 1.0
      // routes: {
      //   AppRoutes.newPage: (context) => const NewPage(),
      //   AppRoutes.otherPage: (context) => const OtherPage(),
      //   AppRoutes.home: (context) => const HomePage(),
      // },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.newPage:
            return MaterialPageRoute(builder: (context) => const NewPage());

          case AppRoutes.otherPage:
            return MaterialPageRoute(
              builder: (context) => OtherPage(user: settings.arguments as User),
            );

              case AppRoutes.home:
            return MaterialPageRoute(
              builder: (context) => HomePage(storeName: settings.arguments as String),
            );


          default:
            return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
    );
  }
}
