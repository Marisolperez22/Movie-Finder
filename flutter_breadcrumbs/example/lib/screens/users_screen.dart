import 'package:flutter/material.dart';
import 'package:flutter_breadcrumbs/flutter_breadcrumbs.dart';
import 'home_screen.dart';
import 'user_details_screen.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DynamicBreadcrumbs(
              items: [
                BreadcrumbItem(
                  
                  title: 'Home',
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                    (route) => false,
                  ),
                ),
                BreadcrumbItem(title: 'Users'),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UserDetailsScreen(userId: '123')),
                );
              },
              child: const Text('Go to User Details'),
            )
          ],
        ),
      ),
    );
  }
}
