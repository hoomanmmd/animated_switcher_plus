part of 'animated_switcher_plus.dart';

/// Animated Switcher with zoom transition
class AnimatedSwitcherZoom extends AnimatedSwitcher {
  /// Animated Switcher with zoom in transition
  @Deprecated('Use AnimatedSwitcherPlus.zoomIn instead.')
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
  @Deprecated('Use AnimatedSwitcherPlus.zoomOut instead.')
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
}
