part of 'animated_switcher_plus.dart';

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
          switchInCurve: switchInCurve ?? _translationCurveIn,
          switchOutCurve: switchOutCurve ?? _translationCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: (child, listenable) => _TranslationTransition(
            listenable: listenable,
            offset: Offset(offset, 0),
            enableFade: enableFade,
            child: child,
          ),
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
          switchInCurve: switchInCurve ?? _translationCurveIn,
          switchOutCurve: switchOutCurve ?? _translationCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: (child, listenable) => _TranslationTransition(
            listenable: listenable,
            offset: Offset(-offset, 0),
            enableFade: enableFade,
            child: child,
          ),
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
          switchInCurve: switchInCurve ?? _translationCurveIn,
          switchOutCurve: switchOutCurve ?? _translationCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: (child, listenable) => _TranslationTransition(
            listenable: listenable,
            offset: Offset(0, offset),
            enableFade: enableFade,
            child: child,
          ),
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
          switchInCurve: switchInCurve ?? _translationCurveIn,
          switchOutCurve: switchOutCurve ?? _translationCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: (child, listenable) => _TranslationTransition(
            listenable: listenable,
            offset: Offset(0, -offset),
            enableFade: enableFade,
            child: child,
          ),
          child: child,
          key: key,
        );
}

class _TranslationTransition extends AnimatedWidget {
  const _TranslationTransition({
    required this.offset,
    required this.enableFade,
    required Animation<double> listenable,
    this.child,
  }) : super(listenable: listenable);

  final Widget? child;
  final Offset offset;
  final bool enableFade;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final isReversed = animation.status.isReversed;

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
  }
}
