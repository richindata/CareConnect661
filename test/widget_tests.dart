import 'package:careconnect661/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('app boots into the accessibility-first dashboard', (tester) async {
    await tester.pumpWidget(const CareConnectApp());
    await tester.pumpAndSettle();

    expect(find.text('CareConnect'), findsOneWidget);
    expect(find.text('Emergency assistance'), findsOneWidget);
  });
}
