import 'package:flutter/widgets.dart';

extension AnimationStatusExtension on AnimationStatus {
  bool get isReversed =>
      this == AnimationStatus.completed || this == AnimationStatus.reverse;
}
