import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hero_profile/models/comic.dart';

import 'customize_card.dart';

typedef ItemClickCallback = void Function(Comic detail);

class ComicItem extends StatelessWidget {
  final Comic comic;
  final ItemClickCallback itemClickCallback;
  final double heightRatio;
  final double widthRatio;

  ComicItem(this.comic,
      {this.itemClickCallback, this.heightRatio = 1, this.widthRatio = 1})
      : assert(comic != null);

  Comic get _comic => comic;

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    return Container(
      margin: EdgeInsets.only(
        top: 10 * heightRatio,
        bottom: 30 * heightRatio,
      ),
      child: CustomizeCard(
        child: InkWell(
          onTap: () => itemClickCallback(comic),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.network(
                _comic.imgPath,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 8 * widthRatio, right: 8 * widthRatio),
                  height: MediaQuery.of(context).size.height * 1 / 7.5,
                  color: Colors.white.withOpacity(1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        _comic.title,
                        textScaleFactor: widthRatio,
                        style: TextStyle(
                          color: _themeData.textTheme.body1.color,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${_comic.shortDesc}',
                        textScaleFactor: widthRatio,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style:
                            TextStyle(color: _themeData.textTheme.body1.color),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
