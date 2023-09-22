import 'package:flutter/widgets.dart';

import 'extensions.dart';

const _curveIn = Curves.easeIn;
const _curveOut = Curves.easeOut;

/// Animated Switcher with zoom transition
class AnimatedSwitcherZoom extends AnimatedSwitcher {
  /// Animated Switcher with zoom in transition
  AnimatedSwitcherZoom.zoomIn({
    required Duration duration,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    double scaleInFactor = 0.88,
    double scaleOutFactor = 1.14,
    Widget? child,
    Key? key,
  }) : super(
          duration: duration,
          reverseDuration: reverseDuration,
          switchInCurve: switchInCurve ?? _curveIn,
          switchOutCurve: switchOutCurve ?? _curveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder:
              zoomTransitionBuilder(scaleInFactor, scaleOutFactor),
          child: child,
          key: key,
        );

  /// Animated Switcher with zoom out transition
  AnimatedSwitcherZoom.zoomOut({
    required Duration duration,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    double scaleInFactor = 1.14,
    double scaleOutFactor = 0.88,
    Widget? child,
    Key? key,
  }) : super(
          duration: duration,
          reverseDuration: reverseDuration,
          switchInCurve: switchInCurve ?? _curveIn,
          switchOutCurve: switchOutCurve ?? _curveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder:
              zoomTransitionBuilder(scaleInFactor, scaleOutFactor),
          child: child,
          key: key,
        );
}

AnimatedSwitcherTransitionBuilder zoomTransitionBuilder(
  double scaleInFactor,
  double scaleOutFactor,
) =>
    (final child, final animation) {
      bool isReversed = animation.status.isReversed;

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
    };
