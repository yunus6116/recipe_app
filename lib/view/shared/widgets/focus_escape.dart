import 'package:flutter/material.dart';

class FocusEscape extends StatelessWidget {
  final Widget child;

  const FocusEscape({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
  }
}
