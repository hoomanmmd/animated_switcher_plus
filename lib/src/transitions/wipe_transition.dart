import 'package:flutter/material.dart';

import '../extensions.dart';

class WipeTransition extends AnimatedWidget {
  const WipeTransition.x(
    this.child,
    Animation<double> listenable,
  )   : axis = Axis.horizontal,
        super(listenable: listenable);

  const WipeTransition.y(
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
    final clipper = axis == Axis.horizontal
        ? (isReversed ? _Clipper.reverseX : _Clipper.x)
        : (isReversed ? _Clipper.reverseY : _Clipper.y);

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => ClipRect(
        clipper: clipper(animation.value),
        child: child,
      ),
      child: child,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  _Clipper.x(this.progress) : clipper = _getClipX;

  _Clipper.reverseX(this.progress) : clipper = _getClipXReverse;

  _Clipper.y(this.progress) : clipper = _getClipY;

  _Clipper.reverseY(this.progress) : clipper = _getClipYReverse;

  final double progress;
  final Rect Function(Size, double) clipper;

  @override
  Rect getClip(Size size) => clipper(size, progress);

  @override
  bool shouldReclip(covariant _Clipper oldClipper) =>
      oldClipper.progress != progress;

  static Rect _getClipXReverse(Size size, double progress) => Rect.fromLTRB(
        size.width * (1 - progress),
        0,
        size.width,
        size.height,
      );

  static Rect _getClipX(Size size, double progress) => Rect.fromLTRB(
        0,
        0,
        size.width * progress,
        size.height,
      );

  static Rect _getClipYReverse(Size size, double progress) => Rect.fromLTRB(
        0,
        size.height * (1 - progress),
        size.width,
        size.height,
      );

  static Rect _getClipY(Size size, double progress) => Rect.fromLTRB(
        0,
        0,
        size.width,
        size.height * progress,
      );
}
