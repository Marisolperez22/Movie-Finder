import 'package:flutter/material.dart';



class FirstStep extends StatelessWidget {
  const FirstStep({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(title: const Text('Paso 1')),
      body: Column(
        children: [
         
          const Expanded(
            child: Center(child: Text('Contenido del Paso 1')),
          ),
        ],
      ),
    );
  }
}
