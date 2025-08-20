part of 'animated_switcher_plus.dart';

/// Animated Switcher with translation transition
class AnimatedSwitcherTranslation extends AnimatedSwitcher {
  /// Animated Switcher with translation transition toward left
  @Deprecated('Use AnimatedSwitcherPlus.translationLeft instead.')
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
  @Deprecated('Use AnimatedSwitcherPlus.translationRight instead.')
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
  @Deprecated('Use AnimatedSwitcherPlus.translationTop instead.')
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
  @Deprecated('Use AnimatedSwitcherPlus.translationBottom instead.')
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
}
