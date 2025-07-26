import 'package:flutter/material.dart';

class AnimatedSwitcherPlusWrapper extends StatefulWidget {
  const AnimatedSwitcherPlusWrapper({
    required this.widgetBuilder,
  });

  final Widget Function(Widget) widgetBuilder;

  @override
  State<AnimatedSwitcherPlusWrapper> createState() =>
      _AnimatedSwitcherPlusWrapperState();
}

class _AnimatedSwitcherPlusWrapperState
    extends State<AnimatedSwitcherPlusWrapper> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    final child = _showFirst
        ? Container(
            key: const ValueKey('1'),
            color: Colors.black,
            width: 100,
            height: 100,
          )
        : Container(
            key: const ValueKey('2'),
            color: Colors.blue,
            width: 100,
            height: 100,
          );

    return Column(
      children: [
        widget.widgetBuilder(child),
        ElevatedButton(
          onPressed: _toggle,
          child: const Text('Animate'),
        ),
      ],
    );
  }

  void _toggle() {
    setState(() => _showFirst = !_showFirst);
  }
}
