import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends HookConsumerWidget {
  final Widget child;
  final bool enabled;

  const ShimmerEffect({super.key, required this.child, this.enabled = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffD8D8D8),
      highlightColor: const Color(0xffB2B2B2),
      enabled: enabled,
      child: child,
    );
  }
}
