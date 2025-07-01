import 'package:example/steps/first_step.dart';
import 'package:flutter/material.dart';
import 'package:form_indicator_bar/form_indicator_bar.dart';

import 'second_step.dart';
import 'third_step.dart';

class FormStep extends StatelessWidget {
  const FormStep({super.key});

  @override
  Widget build(BuildContext context) {
    final steps = [FirstStep(), SecondStep(), ThirdStep()];

    return Scaffold(
      body: SafeArea(
        child: FormIndicatorBarModel(
          formWidgets: steps,
          totalSteps: steps.length,
        ),
      ),
    );
  }
}
