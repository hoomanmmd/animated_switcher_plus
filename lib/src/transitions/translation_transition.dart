import 'package:flutter/material.dart';

import '../extensions.dart';

class TranslationTransition extends AnimatedWidget {
  const TranslationTransition({
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
