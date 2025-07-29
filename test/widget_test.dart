import 'package:animated_switcher_plus/animated_switcher_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'animated_switcher_plus_wrapper.dart';

void main() {
  testWidgets('Test FlipX', (WidgetTester tester) async {
    final widgetBuilder = (Widget child) => AnimatedSwitcherPlus.flipX(
          duration: const Duration(microseconds: 10),
          child: child,
        );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Test FlipY', (WidgetTester tester) async {
    final widgetBuilder = (Widget child) => AnimatedSwitcherPlus.flipY(
          duration: const Duration(microseconds: 10),
          child: child,
        );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Test Translation Bottom', (WidgetTester tester) async {
    final widgetBuilder =
        (Widget child) => AnimatedSwitcherPlus.translationBottom(
              duration: const Duration(microseconds: 10),
              child: child,
            );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Test Translation Top', (WidgetTester tester) async {
    final widgetBuilder = (Widget child) => AnimatedSwitcherPlus.translationTop(
          duration: const Duration(microseconds: 10),
          child: child,
        );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Test Translation Right', (WidgetTester tester) async {
    final widgetBuilder =
        (Widget child) => AnimatedSwitcherPlus.translationRight(
              duration: const Duration(microseconds: 10),
              child: child,
            );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Test Translation Left', (WidgetTester tester) async {
    final widgetBuilder =
        (Widget child) => AnimatedSwitcherPlus.translationLeft(
              duration: const Duration(microseconds: 10),
              child: child,
            );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Test Zoom In', (WidgetTester tester) async {
    final widgetBuilder = (Widget child) => AnimatedSwitcherPlus.zoomIn(
          duration: const Duration(microseconds: 10),
          child: child,
        );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Test Zoom Out', (WidgetTester tester) async {
    final widgetBuilder = (Widget child) => AnimatedSwitcherPlus.zoomOut(
          duration: const Duration(microseconds: 10),
          child: child,
        );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Wipe X', (WidgetTester tester) async {
    final widgetBuilder = (Widget child) => AnimatedSwitcherPlus.wipeX(
          duration: const Duration(microseconds: 10),
          child: child,
        );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });

  testWidgets('Wipe Y', (WidgetTester tester) async {
    final widgetBuilder = (Widget child) => AnimatedSwitcherPlus.wipeY(
          duration: const Duration(microseconds: 10),
          child: child,
        );

    await tester.pumpWidget(
      MaterialApp(
        home: AnimatedSwitcherPlusWrapper(widgetBuilder: widgetBuilder),
      ),
    );

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsNothing);

    await tester.tap(find.text('Animate'));
    await tester.pump();

    expect(find.byKey(const ValueKey('1')), findsOneWidget);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('1')), findsNothing);
    expect(find.byKey(const ValueKey('2')), findsOneWidget);
  });
}
