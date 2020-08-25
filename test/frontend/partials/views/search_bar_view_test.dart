import 'package:Covid19_PH/ui/partials/views/search_bar_view/search_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget _buildTestWidget(Widget child) => MaterialApp(home : child);

  testWidgets('SearchBar should contain text widget \'Search\'', (WidgetTester tester) async {
    SearchBarView searchBar = SearchBarView();

    await tester.pumpWidget(_buildTestWidget(searchBar));

    expect(find.text('Search'), findsOneWidget);
  });
}
