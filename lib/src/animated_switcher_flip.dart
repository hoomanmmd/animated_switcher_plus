import 'dart:math' as math;

import 'package:flutter/widgets.dart';

const _curveIn = Curves.easeOutQuad;
const _curveOut = Curves.easeInQuad;

/// Animated Switcher with flip transition
class AnimatedSwitcherFlip extends AnimatedSwitcher {
  /// Animated Switcher with flip transition around x axis
  AnimatedSwitcherFlip.flipX({
    required Duration duration,
    Duration? reverseDuration,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    Widget? child,
    Key? key,
  }) : super(
          duration: duration,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          reverseDuration: reverseDuration,
          switchInCurve: switchInCurve ?? _curveIn,
          switchOutCurve: switchOutCurve ?? _curveOut,
          transitionBuilder: fadeTransitionBuilder(false),
          child: child,
          key: key,
        );

  /// Animated Switcher with flip transition around y axis
  AnimatedSwitcherFlip.flipY({
    required Duration duration,
    Duration? reverseDuration,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    Widget? child,
    Key? key,
  }) : super(
          duration: duration,
          reverseDuration: reverseDuration,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          switchInCurve: switchInCurve ?? _curveIn,
          switchOutCurve: switchOutCurve ?? _curveOut,
          transitionBuilder: fadeTransitionBuilder(true),
          child: child,
          key: key,
        );
}

AnimatedSwitcherTransitionBuilder fadeTransitionBuilder(bool isYAxis) =>
    (final child, final animation) => _FlipTransition(
          rotate: animation,
          isYAxis: isYAxis,
          child: child,
        );

class _FlipTransition extends AnimatedWidget {
  const _FlipTransition({
    required Animation<double> rotate,
    required this.isYAxis,
    this.child,
    Key? key,
  }) : super(key: key, listenable: rotate);

  final bool isYAxis;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    if (rotate.value < 0.5) {
      return SizedBox.shrink(child: child);
    }
    final transform = Matrix4.identity()..setEntry(3, 2, 0.001);

    if (isYAxis) {
      transform.rotateY((1 - rotate.value) * math.pi);
    } else {
      transform.rotateX((1 - rotate.value) * math.pi);
    }

    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: child,
    );
  }

  Animation<double> get rotate => listenable as Animation<double>;
}
