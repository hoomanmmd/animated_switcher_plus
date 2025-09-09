import 'package:flutter/widgets.dart';

import 'transitions/flip_transition.dart';
import 'transitions/reveal_transition.dart';
import 'transitions/translation_transition.dart';
import 'transitions/wiggle_transition.dart';
import 'transitions/wipe_transition.dart';
import 'transitions/zoom_transition.dart';

part 'animated_switcher_flip.dart';
part 'animated_switcher_translation.dart';
part 'animated_switcher_zoom.dart';

const _flipCurveIn = Curves.easeOutQuad;
const _flipCurveOut = Curves.easeInQuad;
const _translationCurveIn = Curves.easeOutQuad;
const _translationCurveOut = Curves.easeInQuad;
const _zoomCurveIn = Curves.easeIn;
const _zoomCurveOut = Curves.easeOut;
const _wipeCurveIn = Curves.easeInSine;
const _wipeCurveOut = Curves.easeOutSine;
const _revealCurveIn = Curves.easeOutQuad;
const _revealCurveOut = Curves.easeIn;
const _wiggleCurve = Curves.elasticInOut;

/// Animated Switcher plus
class AnimatedSwitcherPlus extends AnimatedSwitcher {
  /// Animated Switcher with flip transition around x axis
  const AnimatedSwitcherPlus.flipX({
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
  const AnimatedSwitcherPlus.flipY({
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
          transitionBuilder: (child, listenable) => TranslationTransition(
            listenable: listenable,
            offset: Offset(offset, 0),
            enableFade: enableFade,
            child: child,
          ),
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
          transitionBuilder: (child, listenable) => TranslationTransition(
            listenable: listenable,
            offset: Offset(-offset, 0),
            enableFade: enableFade,
            child: child,
          ),
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
          transitionBuilder: (child, listenable) => TranslationTransition(
            listenable: listenable,
            offset: Offset(0, offset),
            enableFade: enableFade,
            child: child,
          ),
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
          transitionBuilder: (child, listenable) => TranslationTransition(
            listenable: listenable,
            offset: Offset(0, -offset),
            enableFade: enableFade,
            child: child,
          ),
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
          transitionBuilder: (child, listenable) => ZoomTransition(
            listenable: listenable,
            scaleInFactor: scaleInFactor,
            scaleOutFactor: scaleOutFactor,
            child: child,
          ),
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
          transitionBuilder: (child, listenable) => ZoomTransition(
            listenable: listenable,
            scaleInFactor: scaleInFactor,
            scaleOutFactor: scaleOutFactor,
            child: child,
          ),
          child: child,
          key: key,
        );

  /// Animated Switcher with wipe x transition
  /// Suitable for same-size widgets
  const AnimatedSwitcherPlus.wipeX({
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
          switchInCurve: switchInCurve ?? _wipeCurveIn,
          switchOutCurve: switchOutCurve ?? _wipeCurveOut,
          transitionBuilder: WipeTransition.x,
          child: child,
          key: key,
        );

  /// Animated Switcher with wipe y transition
  /// Suitable for same-size widgets
  const AnimatedSwitcherPlus.wipeY({
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
          switchInCurve: switchInCurve ?? _wipeCurveIn,
          switchOutCurve: switchOutCurve ?? _wipeCurveOut,
          transitionBuilder: WipeTransition.y,
          child: child,
          key: key,
        );

  /// Animated Switcher with reveal x transition
  const AnimatedSwitcherPlus.revealX({
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
          switchInCurve: switchInCurve ?? _revealCurveIn,
          switchOutCurve: switchOutCurve ?? _revealCurveOut,
          transitionBuilder: RevealTransition.horizontal,
          child: child,
          key: key,
        );

  /// Animated Switcher with reveal y transition
  const AnimatedSwitcherPlus.revealY({
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
          switchInCurve: switchInCurve ?? _revealCurveIn,
          switchOutCurve: switchOutCurve ?? _revealCurveOut,
          transitionBuilder: RevealTransition.vertical,
          child: child,
          key: key,
        );

  /// Animated Switcher with reveal y transition
  const AnimatedSwitcherPlus.revealCircular({
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
          switchInCurve: switchInCurve ?? _revealCurveIn,
          switchOutCurve: switchOutCurve ?? _revealCurveOut,
          transitionBuilder: RevealTransition.circular,
          child: child,
          key: key,
        );

  /// Animated Switcher with wiggle transition
  const AnimatedSwitcherPlus.wiggleRadial({
    required Duration duration,
    AnimatedSwitcherLayoutBuilder? layoutBuilder,
    Curve? curve,
    Widget? child,
    Key? key,
  }) : super(
          duration: duration,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          switchInCurve: curve ?? _wiggleCurve,
          switchOutCurve: curve ?? _wiggleCurve,
          transitionBuilder: WiggleTransition.radial,
          child: child,
          key: key,
        );
}
