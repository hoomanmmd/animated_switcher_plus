import 'dart:math' as math;

import 'package:flutter/material.dart';

class FlipTransition extends AnimatedWidget {
  const FlipTransition.flipX(
    this.child,
    Animation<double> listenable,
  )   : axis = Axis.horizontal,
        super(listenable: listenable);

  const FlipTransition.flipY(
    this.child,
    Animation<double> listenable,
  )   : axis = Axis.vertical,
        super(listenable: listenable);

  final Axis axis;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    if (animation.value < 0.5) {
      return SizedBox.shrink(child: child);
    }

    final transform = Matrix4.identity()..setEntry(3, 2, 0.001);

    if (axis == Axis.vertical) {
      transform.rotateY((1 - animation.value) * math.pi);
    } else {
      transform.rotateX((1 - animation.value) * math.pi);
    }

    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: child,
    );
  }
}
