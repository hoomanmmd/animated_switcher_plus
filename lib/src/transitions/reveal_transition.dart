import 'dart:math';

import 'package:flutter/material.dart';

import '../extensions.dart';

class RevealTransition extends AnimatedWidget {
  const RevealTransition.horizontal(
    this.child,
    Animation<double> listenable,
  )   : _revealTypes = _RevealTypes.horizontal,
        super(listenable: listenable);

  const RevealTransition.vertical(
    this.child,
    Animation<double> listenable,
  )   : _revealTypes = _RevealTypes.vertical,
        super(listenable: listenable);

  const RevealTransition.circular(
    this.child,
    Animation<double> listenable,
  )   : _revealTypes = _RevealTypes.circular,
        super(listenable: listenable);

  final Widget? child;
  final _RevealTypes _revealTypes;

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    final isReversed = animation.status.isReversed;

    return isReversed
        ? Opacity(
            opacity: animation.value,
            child: child,
          )
        : ClipRect(
            clipper: _revealTypes.clipper(animation.value),
            child: child,
          );
  }
}

class _Clipper extends CustomClipper<Rect> {
  _Clipper.horizontal(this.progress) : clipper = _getClipHorizontal;

  _Clipper.vertical(this.progress) : clipper = _getClipVertical;

  _Clipper.circular(this.progress) : clipper = _getClipCircular;

  final double progress;
  final Rect Function(Size, double) clipper;

  @override
  Rect getClip(Size size) => clipper(size, progress);

  @override
  bool shouldReclip(covariant _Clipper oldClipper) =>
      oldClipper.progress != progress;

  static Rect _getClipHorizontal(Size size, double progress) {
    final halfWidth = size.width / 2;
    final animatedLength = max(progress, 0.0001) * halfWidth;

    return Rect.fromLTRB(
      halfWidth - animatedLength,
      0,
      halfWidth + animatedLength,
      size.height,
    );
  }

  static Rect _getClipVertical(Size size, double progress) {
    final halfHeight = size.height / 2;

    final animatedLength = max(progress, 0.00001) * halfHeight;

    return Rect.fromLTRB(
      0,
      halfHeight - animatedLength,
      size.width,
      halfHeight + animatedLength,
    );
  }

  static Rect _getClipCircular(Size size, double progress) {
    final cx = size.width / 2;
    final cy = size.height / 2;

    final animatedRadius = max(progress, 0.00001) * sqrt(cx * cx + cy * cy);

    return Rect.fromLTRB(
      cx - animatedRadius,
      cy - animatedRadius,
      cx + animatedRadius,
      cy + animatedRadius,
    );
  }
}

enum _RevealTypes {
  horizontal(_Clipper.horizontal),
  vertical(_Clipper.vertical),
  circular(_Clipper.circular);

  final _Clipper Function(double) clipper;

  const _RevealTypes(this.clipper);
}
