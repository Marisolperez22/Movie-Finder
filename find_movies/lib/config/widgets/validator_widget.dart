import 'package:flutter/material.dart';

enum StateType {
  loading,
  success,
  error,
}

class ValidatorWidget extends StatelessWidget {
  final bool loading;
  final StateType stateType;
  final Widget content;
  final Widget? loader;
  final Widget? errorWidget;
  final Function()? onRetry;

  const ValidatorWidget({
    super.key,
    required this.loading,
    required this.stateType,
    required this.content,
    this.loader,
    this.errorWidget,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (loading || stateType == StateType.loading) {
      return loader ?? _defaultLoader();
    }

    if (stateType == StateType.error) {
      return errorWidget ?? _defaultErrorWidget(context);
    }

    return content;
  }

  Widget _defaultLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _defaultErrorWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Ocurrió un error',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          const SizedBox(height: 16),
          if (onRetry != null)
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Reintentar'),
            ),
        ],
      ),
    );
  }
}