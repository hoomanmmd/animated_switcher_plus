import 'package:flutter/widgets.dart';

import 'extensions.dart';

const _curveIn = Curves.easeInOut;
const _curveOut = Curves.easeInOut;

/// Animated Switcher with translation transition
class AnimatedSwitcherTranslation extends AnimatedSwitcher {
  /// Animated Switcher with translation transition toward left
  AnimatedSwitcherTranslation.left({
    required Duration duration,
    double offset = 1.0,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    Widget? child,
    bool enableFade = true,
    Key? key,
  }) : super(
          duration: duration,
          reverseDuration: reverseDuration,
          switchInCurve: switchInCurve ?? _curveIn,
          switchOutCurve: switchOutCurve ?? _curveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: _transitionBuilder(Offset(offset, 0), enableFade),
          child: child,
          key: key,
        );

  /// Animated Switcher with translation transition toward right
  AnimatedSwitcherTranslation.right({
    required Duration duration,
    double offset = 1.0,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    Widget? child,
    bool enableFade = true,
    Key? key,
  }) : super(
          duration: duration,
          reverseDuration: reverseDuration,
          switchInCurve: switchInCurve ?? _curveIn,
          switchOutCurve: switchOutCurve ?? _curveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: _transitionBuilder(Offset(-offset, 0), enableFade),
          child: child,
          key: key,
        );

  /// Animated Switcher with translation transition toward top
  AnimatedSwitcherTranslation.top({
    required Duration duration,
    double offset = 1.0,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    Widget? child,
    bool enableFade = true,
    Key? key,
  }) : super(
          duration: duration,
          reverseDuration: reverseDuration,
          switchInCurve: switchInCurve ?? _curveIn,
          switchOutCurve: switchOutCurve ?? _curveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: _transitionBuilder(Offset(0, offset), enableFade),
          child: child,
          key: key,
        );

  /// Animated Switcher with translation transition toward bottom
  AnimatedSwitcherTranslation.bottom({
    required Duration duration,
    double offset = 1.0,
    Duration? reverseDuration,
    Curve? switchInCurve,
    Curve? switchOutCurve,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    Widget? child,
    bool enableFade = true,
    Key? key,
  }) : super(
          duration: duration,
          reverseDuration: reverseDuration,
          switchInCurve: switchInCurve ?? _curveIn,
          switchOutCurve: switchOutCurve ?? _curveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: _transitionBuilder(Offset(0, -offset), enableFade),
          child: child,
          key: key,
        );
}

AnimatedSwitcherTransitionBuilder _transitionBuilder(
  Offset offset,
  bool enableFade,
) =>
    (final child, final animation) {
      bool isReversed = animation.status.isReversed;

      return SlideTransition(
        position: Tween<Offset>(
          begin: isReversed ? offset.scale(-1, -1) : offset,
          end: Offset.zero,
        ).animate(animation),
        child: enableFade
            ? FadeTransition(
                opacity: animation,
                child: child,
              )
            : child,
      );
    };
