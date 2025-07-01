import 'package:flutter/material.dart';

class SecondStep extends StatelessWidget {
  const SecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Paso 2')),
      body: Column(
        children: [
          const Expanded(child: Center(child: Text('Contenido del Paso 2'))),
        ],
      ),
    );
  }
}
