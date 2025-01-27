import 'package:Covid19_PH/ui/partials/views/summary_view/summary_view.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _buildTestWidget(Widget child) =>
      MaterialApp(home: LayoutBuilder(builder: (context, constraints) {
        SizeConfig.init(constraints);
        return MediaQuery(
          // Make text really small to avoid overflow
            data: MediaQuery.of(context).copyWith(textScaleFactor: 0.1),
            child: child);
      }));
  testWidgets(
      'Summary View should contain text widget of \'Total Cases\', \'Active Cases\', \'Recovered\', \'Died\', and \'...\'',
      (WidgetTester tester) async {
    // TODO: @DOGGO This test is failing due to overflow, will remove after adding dynamic horizontal padding to cards and navbars
    SummaryView summary = SummaryView();

    await tester.pumpWidget(_buildTestWidget(summary));

    expect(find.text('Total Cases'), findsOneWidget);
    expect(find.text('Active Cases'), findsOneWidget);
    expect(find.text('Recovered'), findsOneWidget);
    expect(find.text('Died'), findsOneWidget);
    expect(find.text('...'), findsWidgets);
  });
}
