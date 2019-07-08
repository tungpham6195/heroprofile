import 'package:flutter/material.dart';
import 'package:hero_profile/blocs/utils/app_theme.dart';

class CustomizeSliverAppbar extends StatelessWidget with AppTheme {
  final String title;
  final Color appBarBgColor;

  CustomizeSliverAppbar({this.title = '', this.appBarBgColor = Colors.white})
      : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: appBarBgColor,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          title: Text(
            '$title',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          background: Container(
            color: Colors.white,
          )),
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
