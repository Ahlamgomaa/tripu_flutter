import 'package:flutter_test/flutter_test.dart';
import 'package:tripu_flutter/app/app.dart';

void main() {
  testWidgets('TripuApp loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TripuApp());
    expect(find.byType(TripuApp), findsOneWidget);
  });
}
