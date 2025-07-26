part of 'animated_switcher_plus.dart';

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
          switchInCurve: switchInCurve ?? _zoomCurveIn,
          switchOutCurve: switchOutCurve ?? _zoomCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: (child, listenable) => _ZoomTransition(
            listenable: listenable,
            scaleInFactor: scaleInFactor,
            scaleOutFactor: scaleOutFactor,
            child: child,
          ),
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
          switchInCurve: switchInCurve ?? _zoomCurveIn,
          switchOutCurve: switchOutCurve ?? _zoomCurveOut,
          layoutBuilder: layoutBuilder ?? AnimatedSwitcher.defaultLayoutBuilder,
          transitionBuilder: (child, listenable) => _ZoomTransition(
            listenable: listenable,
            scaleInFactor: scaleInFactor,
            scaleOutFactor: scaleOutFactor,
            child: child,
          ),
          child: child,
          key: key,
        );
}

class _ZoomTransition extends AnimatedWidget {
  const _ZoomTransition({
    required this.scaleInFactor,
    required this.scaleOutFactor,
    required Animation<double> listenable,
    this.child,
  }) : super(listenable: listenable);

  final Widget? child;
  final double scaleInFactor;
  final double scaleOutFactor;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final isReversed = animation.status.isReversed;

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
  }
}
