import 'package:flutter/material.dart';
import 'package:hero_profile/models/information.dart';
import 'package:hero_profile/widgets/sub_info_item.dart';

import 'customize_card.dart';
import 'themed_text.dart';

class InfoItem extends StatefulWidget {
  final Information information;
  final double itemElevation;
  final double itemBorderRadius;
  final double contentPaddingLeft;
  final double contentPaddingRight;
  final double itemPaddingLeft;
  final double itemPaddingRight;
  final double itemPaddingTop;
  final double itemPaddingBottom;

  InfoItem(
    this.information, {
    this.itemElevation = 6,
    this.itemBorderRadius = 20,
    this.contentPaddingLeft = 15,
    this.contentPaddingRight = 15,
    this.itemPaddingLeft = 10,
    this.itemPaddingRight = 10,
    this.itemPaddingTop = 5,
    this.itemPaddingBottom = 5,
  }) : assert(information != null);

  @override
  _InfoItemState createState() => _InfoItemState();
}

class _InfoItemState extends State<InfoItem> {
  bool isShownSubInfoList = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: CustomizeCard(
              onTap: () => setState(() {
                if (widget.information.subInformation != null &&
                    widget.information.subInformation.isNotEmpty) {
                  isShownSubInfoList = !isShownSubInfoList;
                }
              }),
              contentPadding: EdgeInsets.only(
                left: widget.contentPaddingLeft,
                right: widget.contentPaddingRight,
                top: widget.information.title.isNotEmpty ? 10 : 30,
                bottom: widget.information.title.isNotEmpty ? 10 : 30,
              ),
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    widget.information.title.isNotEmpty
                        ? ThemedText(
                            '${widget.information.title}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          )
                        : Container(),
                    Container(
                      margin: EdgeInsets.only(
                          top: widget.information.title.isNotEmpty ? 10 : 0),
                      child: ThemedText(
                        '${widget.information.description}',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Row(
              children: _buildSubInfoItems(),
            ),
            scrollDirection: Axis.horizontal,
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSubInfoItems() {
    var list = <Widget>[];
    var subInformation = widget.information.subInformation;
    if (subInformation != null) {
      for (Information item in widget.information.subInformation) {
        list.add(SubInfoItem(item));
      }
    }
    return !isShownSubInfoList ? list : [];
  }
}
