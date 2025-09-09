import 'dart:math';

import 'package:flutter/material.dart';

import '../extensions.dart';

const _maxDegree = pi / 15;
const _maxDegreeOnReverse = pi / 30;

class WiggleTransition extends AnimatedWidget {
  const WiggleTransition.radial(
    this.child,
    Animation<double> listenable,
  ) : super(listenable: listenable);

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final isReversed = animation.status.isReversed;

    if (animation.value < 0.5) {
      return SizedBox.shrink(child: child);
    }

    return Transform.rotate(
      angle: (isReversed ? _maxDegreeOnReverse : _maxDegree) *
          sin(animation.value * pi * 2),
      child: child,
    );
  }
}
