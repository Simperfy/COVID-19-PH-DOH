import 'package:Covid19_PH/ui/partials/views/top_regions_view/top_regions_view.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _buildTestWidget(Widget child) =>
      MaterialApp(home: LayoutBuilder(builder: (context, constraints) {
        SizeConfig.init(constraints);
        return child;
      }));

  testWidgets('TopRegionsView should contain text widget \'Loading...\'', (WidgetTester tester) async {
    TopRegionsView topRegions = TopRegionsView();

    await tester.pumpWidget(_buildTestWidget(topRegions));

    expect(find.text('Loading...'), findsOneWidget);
  });
}
