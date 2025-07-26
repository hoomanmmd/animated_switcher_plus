part of 'animated_switcher_plus.dart';

/// Animated Switcher with flip transition
class AnimatedSwitcherFlip extends AnimatedSwitcher {
  /// Animated Switcher with flip transition around x axis
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
          transitionBuilder: _FlipTransition.flipX,
          child: child,
          key: key,
        );

  /// Animated Switcher with flip transition around y axis
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
          transitionBuilder: _FlipTransition.flipY,
          child: child,
          key: key,
        );
}

class _FlipTransition extends AnimatedWidget {
  const _FlipTransition.flipX(
    this.child,
    Animation<double> listenable,
  )   : axis = Axis.horizontal,
        super(listenable: listenable);

  const _FlipTransition.flipY(
    this.child,
    Animation<double> listenable,
  )   : axis = Axis.vertical,
        super(listenable: listenable);

  final Axis axis;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    if (animation.value < 0.5) {
      return SizedBox.shrink(child: child);
    }
    final transform = Matrix4.identity()..setEntry(3, 2, 0.001);

    if (axis == Axis.vertical) {
      transform.rotateY((1 - animation.value) * math.pi);
    } else {
      transform.rotateX((1 - animation.value) * math.pi);
    }

    return Transform(
      transform: transform,
      alignment: Alignment.center,
      child: child,
    );
  }
}
