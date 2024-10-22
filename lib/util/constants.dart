import 'package:flutter/material.dart';

// Summary
final Color searchBarBgColor = Color(0xfff2f2f2);
final Color searchBarPrimaryColor = Color(0xFF828282);

final Color totalCasesBgColor = Color(0xff56CCF2).withOpacity(0.85);
final Color activeCasesBgColor = Color(0xffF2C94C);
final Color recoveredBgColor = Color(0xff6FCF97).withOpacity(0.65);
final Color diedBgColor = Color(0xffBDBDBD).withOpacity(0.80);

final double summaryLabelFontSizeMultiplier = 0.20;
final double summaryCountFontSizeMultiplier = 0.50;
// ./Summary

// Timeline
final Color dailyCasesBgColor = Color(0xffBECFB8).withOpacity(0.27);
// ./Timeline

// Facilities
final double facilitiesSummaryGradientBarLength = 24 * 8.0; // 192
// ./Facilities

final double specificFacilitiesSummaryGradientBarLength = 88.0;

// BottomNavbar
final Color bottomNavBarActiveColor = Color(0xff2D9CDB);
final Color bottomNavBarIdleColor = Color(0xff8C8C8C);
// ./BottomNavbar

// Common TextStyles
final TextStyle whiteTextStyle = TextStyle(color: Colors.white);
final TextStyle blackTextStyle = TextStyle(color: Colors.black);

enum SEARCH_BAR { HOME, FACILITIES, MAPS, NONE }