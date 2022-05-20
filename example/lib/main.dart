import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:example/example_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedSwitcher Plus demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ExamplePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showFirstChild = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sample')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          AnimatedSwitcherFlip.flipY(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(_showFirstChild),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:
                    _showFirstChild ? Colors.blue.shade50 : Colors.red.shade50,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                _showFirstChild ? 'Primary Text' : 'Secondary Text',
              ),
            ),
          ),
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
    );
  }
}
