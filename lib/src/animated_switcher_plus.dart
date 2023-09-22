import 'package:flutter/widgets.dart';

import 'animated_switcher_flip.dart';
import 'animated_switcher_translation.dart';
import 'animated_switcher_zoom.dart';

const _flipCurveIn = Curves.easeOutQuad;
const _flipCurveOut = Curves.easeInQuad;
const _translationCurveIn = Curves.easeOutQuad;
const _translationCurveOut = Curves.easeInQuad;
const _zoomCurveIn = Curves.easeIn;
const _zoomCurveOut = Curves.easeOut;

/// Animated Switcher plus
class AnimatedSwitcherPlus extends AnimatedSwitcher {
  /// Animated Switcher with flip transition around x axis
  AnimatedSwitcherPlus.flipX({
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
          transitionBuilder: fadeTransitionBuilder(false),
          child: child,
          key: key,
        );

  /// Animated Switcher with flip transition around y axis
  AnimatedSwitcherPlus.flipY({
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
          transitionBuilder: fadeTransitionBuilder(true),
          child: child,
          key: key,
        );

  /// Animated Switcher with translation transition toward left
  AnimatedSwitcherPlus.translationLeft({
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
          switchInCurve: switchInCurve ?? _translationCurveIn,
          switchOutCurve: switchOutCurve ?? _translationCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder:
              translationTransitionBuilder(Offset(offset, 0), enableFade),
          child: child,
          key: key,
        );

  /// Animated Switcher with translation transition toward right
  AnimatedSwitcherPlus.translationRight({
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
          switchInCurve: switchInCurve ?? _translationCurveIn,
          switchOutCurve: switchOutCurve ?? _translationCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder:
              translationTransitionBuilder(Offset(-offset, 0), enableFade),
          child: child,
          key: key,
        );

  /// Animated Switcher with translation transition toward top
  AnimatedSwitcherPlus.translationTop({
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
          switchInCurve: switchInCurve ?? _translationCurveIn,
          switchOutCurve: switchOutCurve ?? _translationCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder:
              translationTransitionBuilder(Offset(0, offset), enableFade),
          child: child,
          key: key,
        );

  /// Animated Switcher with translation transition toward bottom
  AnimatedSwitcherPlus.translationBottom({
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
          switchInCurve: switchInCurve ?? _translationCurveIn,
          switchOutCurve: switchOutCurve ?? _translationCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder:
              translationTransitionBuilder(Offset(0, -offset), enableFade),
          child: child,
          key: key,
        );

  /// Animated Switcher with zoom in transition
  AnimatedSwitcherPlus.zoomIn({
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
          switchInCurve: switchInCurve ?? _zoomCurveIn,
          switchOutCurve: switchOutCurve ?? _zoomCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder:
              zoomTransitionBuilder(scaleInFactor, scaleOutFactor),
          child: child,
          key: key,
        );

  /// Animated Switcher with zoom out transition
  AnimatedSwitcherPlus.zoomOut({
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
          switchInCurve: switchInCurve ?? _zoomCurveIn,
          switchOutCurve: switchOutCurve ?? _zoomCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder:
              zoomTransitionBuilder(scaleInFactor, scaleOutFactor),
          child: child,
          key: key,
        );
}
