import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';

class BlurTransition extends AnimatedWidget {
  const BlurTransition(
    this.child,
    Animation<double> listenable,
  ) : super(listenable: listenable);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    if (animation.value < 0.5) {
      return Opacity(opacity: 0, child: child);
    }

    final animationValueComplement = min(1.0, max(0.0, 1 - animation.value));
    final blurIntensity = animationValueComplement * 8;

    return ClipRect(
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blurIntensity,
                sigmaY: blurIntensity,
              ),
              child: ColoredBox(
                color: Color.fromARGB(
                  (animationValueComplement * 12).toInt(),
                  255,
                  255,
                  255,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
