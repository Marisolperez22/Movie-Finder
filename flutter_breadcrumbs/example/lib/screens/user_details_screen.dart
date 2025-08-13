import 'package:flutter/material.dart';
import 'package:flutter_breadcrumbs/flutter_breadcrumbs.dart';
import 'home_screen.dart';
import 'users_screen.dart';

class UserDetailsScreen extends StatelessWidget {
  final String userId;

  const UserDetailsScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Details')),
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
                BreadcrumbItem(
                  title: 'Users',
                  onTap: () => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const UsersScreen()),
                    (route) => false,
                  ),
                ),
                BreadcrumbItem(title: 'Details'),
              ],
            ),
            const SizedBox(height: 40),
            Text('Showing details for user ID: $userId'),
          ],
        ),
      ),
    );
  }
}
