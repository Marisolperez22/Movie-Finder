import 'package:flutter/material.dart';

import 'form_indicator_bar_widget.dart';

class FormIndicatorBarModel extends StatefulWidget {
  final int totalSteps;
  final List<Widget> formWidgets;

  const FormIndicatorBarModel({
    super.key,
    required this.totalSteps,
    required this.formWidgets,
  });

  @override
  State<FormIndicatorBarModel> createState() => _FormIndicatorBarModelState();
}

class _FormIndicatorBarModelState extends State<FormIndicatorBarModel> {
  int _currentStep = 1;
  int currentScreen = 0;


  void _onItemTapped(int index) {
    setState(() {
      currentScreen = index;
      _currentStep = index + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StepBar(
          currentStep: _currentStep,
          totalSteps: widget.totalSteps,
          onItemTapped: _onItemTapped,
        ),
        Expanded(
          child: IndexedStack(
            index: currentScreen,
            children: widget.formWidgets,
          ),
        ),
      ],
    );
  }
}
