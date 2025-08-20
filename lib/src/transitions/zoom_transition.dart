import 'package:flutter/material.dart';

import '../extensions.dart';

class ZoomTransition extends AnimatedWidget {
  const ZoomTransition({
    required this.scaleInFactor,
    required this.scaleOutFactor,
    required Animation<double> listenable,
    this.child,
  }) : super(listenable: listenable);

  final Widget? child;
  final double scaleInFactor;
  final double scaleOutFactor;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final isReversed = animation.status.isReversed;

    return ScaleTransition(
      scale: Tween<double>(
        begin: isReversed ? scaleOutFactor : scaleInFactor,
        end: 1.0,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: child,
      ),
    );
  }
}
