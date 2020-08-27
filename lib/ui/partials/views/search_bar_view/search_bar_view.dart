import 'package:Covid19_PH/ui/partials/views/search_bar_view/search_bar_view_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/helper.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SearchBarView extends StatelessWidget implements PreferredSizeWidget {
  final SearchDelegate<String> searchDelegate;
  SearchBarView({@required this.searchDelegate});

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SearchBarViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => SearchBarViewModel(),
        builder: (context, model, child) => AppBar(
          title: _buildTitle(context),
          backgroundColor: Colors.white,
          titleSpacing: SizeConfig.getCardsPadding,
          actions: _buildActions(context),
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.getAppbarHeight);

  Widget _buildTitle(BuildContext context) => GestureDetector(
        onTap: () => showSearch(
          context: context,
          delegate: searchDelegate,
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: SizeConfig.getAppbarHeight * 0.677,
          padding: EdgeInsets.only(left: SizeConfig.getCardsPadding / 2),
          decoration: BoxDecoration(color: searchBarBgColor),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Search',
              style: TextStyle(fontSize: SizeConfig.getAppbarTextSize, color: searchBarPrimaryColor),
            ),
          ),
        ),
      );

  List<Widget> _buildActions(BuildContext context) => <Widget>[
        Padding(
          padding: EdgeInsets.only(right: SizeConfig.getCardsPadding),
          child: IconButton(
            icon: Helper.buildSvg(
                svgFileName: 'search', color: searchBarPrimaryColor, width: SizeConfig.getAppbarIconSize),
            onPressed: () => showSearch(
              context: context,
              delegate: searchDelegate,
            ),
          ),
        ),
      ];
}
