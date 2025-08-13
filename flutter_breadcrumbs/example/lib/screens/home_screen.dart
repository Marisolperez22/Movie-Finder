import 'package:flutter/material.dart';
import 'package:flutter_breadcrumbs/flutter_breadcrumbs.dart';

import 'users_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DynamicBreadcrumbs(
              items: [
                BreadcrumbItem(title: 'Home', ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UsersScreen()),
                );
              },
              child: const Text('Go to Users'),
            )
          ],
        ),
      ),
    );
  }
}
