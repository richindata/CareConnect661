import 'package:careconnect661/screens/home_screen.dart';
import 'package:careconnect661/state/accessibility_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('accessibility panel renders ahead of the main content on wide layouts',
      (tester) async {
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final settings = AccessibilitySettings();

    await tester.pumpWidget(
      MaterialApp(
        home: HomeScreen(settings: settings),
      ),
    );

    expect(find.text('Left-hand accessibility'), findsOneWidget);
    expect(find.text('Left-hand mode'), findsOneWidget);

    final panelLeft = tester.getTopLeft(find.byKey(const Key('accessibility-panel')));
    final contentLeft = tester.getTopLeft(find.byKey(const Key('home-content')));

    expect(panelLeft.dx, lessThan(contentLeft.dx));
  });
}
