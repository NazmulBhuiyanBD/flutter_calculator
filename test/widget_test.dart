import 'package:first_p/app/app.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Hello world test", (WidgetTester tester) async {
    await tester.pumpWidget(const Myapp());
    expect(find.byType(Container), findsOneWidget);
    expect(find.text("hellow world"), findsOneWidget);
  });
}
