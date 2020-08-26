import 'package:Covid19_PH/ui/partials/views/summary_view/summary_view.dart';
import 'package:Covid19_PH/ui/partials/views/timeline_view/timeline_view.dart';
import 'package:Covid19_PH/ui/widgets/timeline_chart_widget/timeline_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _buildTestWidget(Widget child) => MaterialApp(home : child);

  testWidgets('TimelineView should contain TimelineChartWidget & text of \'Daily Cases\' and \'...\'', (WidgetTester tester) async {
    TimelineView timeline = TimelineView();

    await tester.pumpWidget(_buildTestWidget(timeline));

    expect(find.text('Daily Cases'), findsOneWidget);
    expect(find.byType(TimelineChartWidget), findsOneWidget);
  });
}
