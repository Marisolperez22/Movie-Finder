import 'package:flutter/material.dart';

class StepBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final Color? unfilledBarColor;
  final Color? filledBarColor;
  final Function(int) onItemTapped;

  const StepBar({
    super.key,
    this.totalSteps = 2,
    required this.currentStep,
    required this.onItemTapped,
    this.unfilledBarColor,
    this.filledBarColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return totalSteps < 1
        ? SizedBox.shrink()
        : Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 10.0,
                    child: Container(
                      height: size.height * 0.012,
                      color:
                          unfilledBarColor ??
                          const Color.fromARGB(255, 234, 234, 234),
                    ),
                  ),
                  Positioned(
                    left: 1.0,
                    top: 10.0,
                    child: Container(
                      height: size.height * 0.012,
                      width: size.width * (currentStep / totalSteps),
                      color:
                          filledBarColor ?? const Color.fromRGBO(8, 153, 88, 1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(totalSteps, (index) {
                      return StepCircle(
                        number: index + 1,
                        isActive: index < currentStep,
                        onTap: () => onItemTapped(index),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        );
  }
}

class StepCircle extends StatelessWidget {
  final int number;
  final bool isActive;
  final VoidCallback onTap;

  const StepCircle({
    super.key,
    required this.isActive,
    required this.number,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color:
              isActive
                  ? const Color.fromRGBO(8, 153, 88, 1)
                  : const Color.fromARGB(255, 195, 195, 195),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            '$number',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
