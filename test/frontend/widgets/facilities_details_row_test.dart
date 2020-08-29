import 'package:Covid19_PH/ui/widgets/facilities_widgets/facilities_details_row.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _buildTestWidget(Widget child) =>
      MaterialApp(home: LayoutBuilder(builder: (context, constraints) {
        SizeConfig.init(constraints);
        return child;
      }));
  testWidgets('test facilities Details Row', (WidgetTester tester) async {
    await tester.pumpWidget(_buildTestWidget(
      FacilitiesDetailsRow(
        occupancyRate: 0.5,
        title: 'isolation beds:',
        occupied: 100,
        vacant: 100,
      ),
    ));
    final row = find.byType(FacilitiesDetailsRow);
    expect(row, findsOneWidget);
    expect(find.text('isolation beds:'), findsOneWidget);
  });
}
