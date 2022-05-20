import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool _showFirstChild = true;
  final _spacer = const SizedBox(height: 56);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: AnimatedSwitcherTranslation.top(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherTranslation.bottom(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: AnimatedSwitcherTranslation.left(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherTranslation.right(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: AnimatedSwitcherFlip.flipX(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherFlip.flipY(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: AnimatedSwitcherZoom.zoomIn(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherZoom.zoomOut(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
              ],
            ),
            _spacer,
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => setState(() {
                  _showFirstChild = !_showFirstChild;
                }),
                child: const Text('Animate'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _child() => Container(
        key: ValueKey(_showFirstChild),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: _showFirstChild ? Colors.blue.shade50 : Colors.red.shade50,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          _showFirstChild ? 'Primary' : 'Secondary',
        ),
      );
}
