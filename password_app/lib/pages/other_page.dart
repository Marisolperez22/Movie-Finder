import 'package:flutter/material.dart';

import '../models/user.dart';

class OtherPage extends StatelessWidget {
  final User user; 
  
  const OtherPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Other Page')),
      body: Center(
        child: ElevatedButton(
          child:  Text('Hola ${user.name} tienes ${user.edad}'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
