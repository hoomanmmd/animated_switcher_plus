import 'package:flutter/material.dart';

import '../extensions.dart';

class RevealTransition extends AnimatedWidget {
  const RevealTransition.horizontal(
    this.child,
    Animation<double> listenable,
  )   : axis = Axis.horizontal,
        super(listenable: listenable);

  const RevealTransition.vertical(
    this.child,
    Animation<double> listenable,
  )   : axis = Axis.vertical,
        super(listenable: listenable);

  final Widget? child;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final isReversed = animation.status.isReversed;
    final clipper =
        axis == Axis.horizontal ? _Clipper.horizontal : _Clipper.vertical;

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => isReversed
          ? Opacity(
              opacity: animation.value,
              child: child,
            )
          : ClipRect(
              clipper: clipper(animation.value),
              child: child,
            ),
      child: child,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  _Clipper.horizontal(this.progress) : clipper = _getClipHorizontal;

  _Clipper.vertical(this.progress) : clipper = _getClipVertical;

  final double progress;
  final Rect Function(Size, double) clipper;

  @override
  Rect getClip(Size size) => clipper(size, progress);

  @override
  bool shouldReclip(covariant _Clipper oldClipper) =>
      oldClipper.progress != progress;

  static Rect _getClipHorizontal(Size size, double progress) {
    final halfWidth = size.width / 2;

    if (progress == 0) {
      return Rect.fromLTRB(
        halfWidth - 0.00001,
        0,
        halfWidth + 0.00001,
        size.height,
      );
    }
    final animatedLength = progress * halfWidth;

    return Rect.fromLTRB(
      halfWidth - animatedLength,
      0,
      halfWidth + animatedLength,
      size.height,
    );
  }

  static Rect _getClipVertical(Size size, double progress) {
    final halfHeight = size.height / 2;

    if (progress == 0) {
      return Rect.fromLTRB(
        0,
        halfHeight - 0.00001,
        size.width,
        halfHeight + 0.00001,
      );
    }

    final animatedLength = progress * halfHeight;

    return Rect.fromLTRB(
      0,
      halfHeight - animatedLength,
      size.width,
      halfHeight + animatedLength,
    );
  }
}
