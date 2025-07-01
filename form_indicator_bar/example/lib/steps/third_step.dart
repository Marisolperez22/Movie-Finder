import 'package:flutter/material.dart';

class ThirdStep extends StatelessWidget {
  const ThirdStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paso 3')),
      body: Column(
        children: [
          const Expanded(child: Center(child: Text('Contenido del Paso 3'))),
        ],
      ),
    );
  }
}
