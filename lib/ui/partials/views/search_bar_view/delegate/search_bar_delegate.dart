import 'package:Covid19_PH/ui/pages/views/home_view/home_view.dart';
import 'package:flutter/material.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  static final SearchBarDelegate _singleton = SearchBarDelegate._internal();
  factory SearchBarDelegate() => _singleton;
  SearchBarDelegate._internal();

  // SearchBarDelegate()
  // : super(
  // searchFieldLabel: 'Search',
  // searchFieldStyle: TextStyle(fontSize: 30),
  // );

  final data = [
    'BARMM',
    'CAR',
    'CARAGA',
    'NCR',
    'Region I: Ilocos Region',
    'Region II: Cagayan Valley',
    'Region III: Central Luzon',
    'Region IV-A: CALABARZON',
    'Region IV-B: MIMAROPA',
    'Region IX: Zamboanga Peninsula',
    'Region V: Bicol Region',
    'Region VI: Western Visayas',
    'Region VII: Central Visayas',
    'Region VIII: Eastern Visayas',
    'Region X: Northern Mindanao',
    'Region XI: Davao Region',
    'Region XII: SOCCSKSARGEN',
    'REPATRIATE',
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
  Widget buildResults(BuildContext context) {
    if (data.contains(query)) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: HomeView(regionQuery: 'ncr'),
      );
    }
    return Container();
  }

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
        key: Key(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];

          if (recentQueries.contains(query)) recentQueries.remove(query);

          recentQueries.insert(0, query);
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
