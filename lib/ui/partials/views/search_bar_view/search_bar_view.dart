import 'package:Covid19_PH/ui/partials/views/search_bar_view/delegate/search_bar_delegate.dart';
import 'package:Covid19_PH/ui/partials/views/search_bar_view/search_bar_view_model.dart';
import 'package:Covid19_PH/util/constants.dart';
import 'package:Covid19_PH/util/helper.dart';
import 'package:Covid19_PH/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SearchBarView extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<SearchBarViewModel>.reactive(
        disposeViewModel: false,
        initialiseSpecialViewModelsOnce: true,
        viewModelBuilder: () => SearchBarViewModel(),
        builder: (context, model, child) => AppBar(
          title: _buildTitle(context),
          backgroundColor: Colors.white,
          titleSpacing: 30,
          actions: _buildActions(context),
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.getAppbarHeight);

  Widget _buildTitle(BuildContext context) => GestureDetector(
        onTap: () => showSearch(
          context: context,
          delegate: SearchBarDelegate(),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 42.0,
          padding: EdgeInsets.only(left: 15.0),
          decoration: BoxDecoration(color: searchBarBgColor),
          child: Container(
            height: 42.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Search',
                style: TextStyle(fontSize: 30.0, color: searchBarPrimaryColor),
              ),
            ),
          ),
        ),
      );

  List<Widget> _buildActions(BuildContext context) => <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 30),
          child: IconButton(
            icon: Helper.buildSvg(
                svgFileName: 'search', color: searchBarPrimaryColor),
            onPressed: () => showSearch(
              context: context,
              delegate: SearchBarDelegate(),
            ),
          ),
        ),
      ];
}
