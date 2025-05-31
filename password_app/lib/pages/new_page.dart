import 'package:flutter/material.dart';
import 'package:password_app/models/user.dart';

import '../config/app_routes.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = User(name: 'Marisol', edad: 25);
    return Scaffold(
      appBar: AppBar(title: const Text('New Page')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Hola'),
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.otherPage, arguments: user);
          },
        ),
      ),
    );
  }
}
