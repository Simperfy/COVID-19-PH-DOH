import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  SearchField(
      {@required this.searchBGColor,
      @required this.searchTxtColor,
      @required this.searchTxt});

  final Color searchBGColor;
  final Color searchTxtColor;
  final String searchTxt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: 42.0,
      padding: EdgeInsets.only(left: 15.0),
      decoration: BoxDecoration(color: searchBGColor),
      child: Container(
        height: 42.0,
        child: Align(
          child: TextField(
            style: TextStyle(fontSize: 30.0),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(),
              border: InputBorder.none,
              hintText: 'Search',
            ),
          ),
        ),
      ),
    );
  }
}
