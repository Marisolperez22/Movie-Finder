import 'package:example/steps/first_step.dart';
import 'package:example/steps/form_step.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Step Progress Navigator Demo',
      home: const FormStep(),
    );
  }
}
