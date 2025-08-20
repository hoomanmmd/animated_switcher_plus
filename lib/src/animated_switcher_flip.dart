part of 'animated_switcher_plus.dart';

/// Animated Switcher with flip transition
class AnimatedSwitcherFlip extends AnimatedSwitcher {
  /// Animated Switcher with flip transition around x axis
  @Deprecated('Use AnimatedSwitcherPlus.flipX instead.')
  const AnimatedSwitcherFlip.flipX({
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
          switchInCurve: switchInCurve ?? _flipCurveIn,
          switchOutCurve: switchOutCurve ?? _flipCurveOut,
          transitionBuilder: FlipTransition.flipX,
          child: child,
          key: key,
        );

  /// Animated Switcher with flip transition around y axis
  @Deprecated('Use AnimatedSwitcherPlus.flipY instead.')
  const AnimatedSwitcherFlip.flipY({
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
          switchInCurve: switchInCurve ?? _flipCurveIn,
          switchOutCurve: switchOutCurve ?? _flipCurveOut,
          transitionBuilder: FlipTransition.flipY,
          child: child,
          key: key,
        );
}
