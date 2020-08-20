import 'package:Covid19_PH/ui/pages/views/home_view/home_view.dart';
import 'package:flutter/material.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  SearchBarDelegate()
      : super(
            // searchFieldLabel: 'Search',
            // searchFieldStyle: TextStyle(fontSize: 30),
            );
  final data = [
    'BARMM',
    'CAR',
    'CARAGA',
    'NCR',
    'Region I: Ilocos Region',
    'Region II: Cagayan Valley',
    'Region III: Central Luzon',
    'Region 4',
    'Region 5',
    'Region 6'
  ];
  var recentQueries = [];

  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () => query = "",
        )
      ];

  /// Build icon before text field
  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => close(context, null));

  /// Shows results
  @override
  Widget buildResults(BuildContext context) => HomeView(regionQuery: query);

  /// Shows suggestion as you type or the previous results
  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentQueries
        : data
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();

    return ListView.separated(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          query = suggestionList[index];
          recentQueries.add(suggestionList[index]);
          print(recentQueries);
          showResults(context);
        },
        // leading: Icon(Icons.location_on),
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(suggestionList[index], style: TextStyle(fontSize: 30)),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
    );
  }
}
