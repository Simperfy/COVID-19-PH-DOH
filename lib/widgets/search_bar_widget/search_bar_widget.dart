import 'package:Covid19_PH/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'search_field.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget svg;

  @override
  final Size preferredSize;

  SearchBarWidget()
      : preferredSize = Size.fromHeight(mainHeight),
      this.svg = SvgPicture.asset(
      'assets/icons/search.svg',
      color: searchBarBgColor,
      placeholderBuilder: (context) => Icon(Icons.error),
    );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SearchField(searchBGColor: searchBarBgColor, searchTxtColor: searchBarPrimaryColor, searchTxt: 'Searchs'),
            SizedBox(child: svg, width: 42, height: 42),
          ],
        ),
      ),
    );
  }
}
