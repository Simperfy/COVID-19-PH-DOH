import 'package:Covid19_PH/ui/partials/views/top_regions_view/top_regions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _buildTestWidget(Widget child) => MaterialApp(home : child);

  testWidgets('TopRegionsView should contain text widget \'Loading...\'', (WidgetTester tester) async {
    TopRegionsView topRegions = TopRegionsView();

    await tester.pumpWidget(_buildTestWidget(topRegions));

    expect(find.text('Loading...'), findsOneWidget);
  });
}
