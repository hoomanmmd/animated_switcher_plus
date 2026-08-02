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
            Row(
              children: [
                Expanded(
                  child: AnimatedSwitcherPlus.translationTop(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherPlus.translationBottom(
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
                  child: AnimatedSwitcherPlus.translationLeft(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherPlus.translationRight(
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
                  child: AnimatedSwitcherPlus.flipX(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherPlus.flipY(
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
                  child: AnimatedSwitcherPlus.zoomIn(
                    duration: const Duration(milliseconds: 400),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherPlus.zoomOut(
                    duration: const Duration(milliseconds: 400),
                    child: _child(),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: AnimatedSwitcherPlus.wipeX(
                    duration: const Duration(milliseconds: 400),
                    child: _fixedSizeChild(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherPlus.wipeY(
                    duration: const Duration(milliseconds: 400),
                    child: _fixedSizeChild(),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: AnimatedSwitcherPlus.revealX(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherPlus.revealY(
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
                  child: AnimatedSwitcherPlus.revealCircular(
                    duration: const Duration(milliseconds: 800),
                    child: _child(),
                  ),
                ),
                Expanded(
                  child: AnimatedSwitcherPlus.wiggleRadial(
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
                  child: AnimatedSwitcherPlus.blur(
                    duration: const Duration(milliseconds: 600),
                    child: _child(),
                  ),
                ),
              ],
            ),
            _spacer,
            ElevatedButton(
              onPressed: () => setState(() {
                _showFirstChild = !_showFirstChild;
              }),
              child: const Text('Animate'),
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

  Widget _fixedSizeChild() => Container(
        key: ValueKey(_showFirstChild),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: _showFirstChild ? Colors.blue.shade50 : Colors.red.shade50,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Icon(
          _showFirstChild ? Icons.add_call : Icons.call,
          size: 42,
        ),
      );
}
