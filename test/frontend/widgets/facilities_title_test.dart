import 'package:Covid19_PH/ui/widgets/facilities_widgets/facilitites_title.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _buildTestWidget(Widget child) =>
      MaterialApp(home: LayoutBuilder(builder: (context, constraints) {
        SizeConfig.init(constraints);
        return child;
      }));
  testWidgets('Test Facilities Title Widget with Enabled Legends',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildTestWidget(
        FacilitiesTitle(
          title: 'The title',
          enableLegends: true,
        ),
      ),
    );
    final title = find.byType(FacilitiesTitle);
    expect(title, findsOneWidget);
    expect(find.text('The title'), findsOneWidget);
  });

  testWidgets('Test Facilities Title Widget with Enabled Legends',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      _buildTestWidget(
        FacilitiesTitle(
          title: 'The title',
          enableLegends: false,
        ),
      ),
    );
    final title = find.byType(FacilitiesTitle);
    expect(title, findsOneWidget);
    expect(find.text('The title'), findsOneWidget);
  });
}
