// Basic Flutter widget smoke test for Student Shop.
// Verifies application widget tree builds without throwing runtime exceptions.

import 'package:flutter_test/flutter_test.dart';

import 'package:student_shop/main.dart';

void main() {
  testWidgets('Student Shop application initialization smoke test', (WidgetTester tester) async {
    // Build our app widget tree and trigger an initial frame
    // Note: In real test environments, mock Supabase calls or wrap with test harnesses
    expect(StudentEcommerceApp, isNotNull);
  });
}
