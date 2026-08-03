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
            _spacer,
            Row(
              children: [
                Expanded(
                  child: _item(
                    "Blur",
                    AnimatedSwitcherPlus.blur(
                      duration: const Duration(milliseconds: 600),
                      child: _child(),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: _item(
                    "Translation Top",
                    AnimatedSwitcherPlus.translationTop(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
                Expanded(
                  child: _item(
                    "Translation Bottom",
                    AnimatedSwitcherPlus.translationBottom(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: _item(
                    "Translation Left",
                    AnimatedSwitcherPlus.translationLeft(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
                Expanded(
                  child: _item(
                    "Translation Right",
                    AnimatedSwitcherPlus.translationRight(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: _item(
                    "Flip X",
                    AnimatedSwitcherPlus.flipX(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
                Expanded(
                  child: _item(
                    "Flip Y",
                    AnimatedSwitcherPlus.flipY(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: _item(
                    "Zoom In",
                    AnimatedSwitcherPlus.zoomIn(
                      duration: const Duration(milliseconds: 400),
                      child: _child(),
                    ),
                  ),
                ),
                Expanded(
                  child: _item(
                    "Zoom Out",
                    AnimatedSwitcherPlus.zoomOut(
                      duration: const Duration(milliseconds: 400),
                      child: _child(),
                    ),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: _item(
                    "Wipe X",
                    AnimatedSwitcherPlus.wipeX(
                      duration: const Duration(milliseconds: 400),
                      child: _fixedSizeChild(),
                    ),
                  ),
                ),
                Expanded(
                  child: _item(
                    "Wipe Y",
                    AnimatedSwitcherPlus.wipeY(
                      duration: const Duration(milliseconds: 400),
                      child: _fixedSizeChild(),
                    ),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: _item(
                    "Reveal X",
                    AnimatedSwitcherPlus.revealX(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
                Expanded(
                  child: _item(
                    "Reveal Y",
                    AnimatedSwitcherPlus.revealY(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
              ],
            ),
            _spacer,
            Row(
              children: [
                Expanded(
                  child: _item(
                    "Reveal Circular",
                    AnimatedSwitcherPlus.revealCircular(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
                  ),
                ),
                Expanded(
                  child: _item(
                    "Wiggle Radial",
                    AnimatedSwitcherPlus.wiggleRadial(
                      duration: const Duration(milliseconds: 800),
                      child: _child(),
                    ),
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

  Widget _item(String name, Widget child) {
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 32),
      child: Row(
        children: [
          Expanded(child: Text(name)),
          Expanded(child: child),
        ],
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
