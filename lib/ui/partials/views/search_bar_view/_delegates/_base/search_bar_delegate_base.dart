import 'package:Covid19_PH/util/size_config.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

abstract class SearchBarDelegateBase extends SearchDelegate<String> {
  SearchBarDelegateBase()
      : super(
          searchFieldLabel: 'Search',
          searchFieldStyle: TextStyle(fontSize: SizeConfig.getAppbarTextSize),
          keyboardType: TextInputType.text,
        );

  // List<String> data = ['Overide this in subclass'];
  List<String> data = [];
  List<String> recentQueries = [];

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
  Widget buildResults(BuildContext context);

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
          child: AutoSizeText(
            suggestionList[index],
            maxLines: 1,
            maxFontSize: 24,
            minFontSize: 16,
          ),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(
        thickness: 1,
      ),
    );
  }
}
