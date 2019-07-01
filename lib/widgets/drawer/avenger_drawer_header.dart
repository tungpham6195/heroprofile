import 'package:flutter/material.dart';

class AvengerDrawerHeader extends StatefulWidget {
  final String avatar;
  final String title;
  final double circleBorderWidth;
  final double avatarSize;

  AvengerDrawerHeader({
    @required this.avatar,
    this.title = '',
    this.circleBorderWidth = 2,
    this.avatarSize = 70,
  })  : assert(avatar != null),
        assert(title != null),
        assert(circleBorderWidth >= 0),
        assert(avatarSize > 0);

  @override
  _AvengerDrawerHeaderState createState() => _AvengerDrawerHeaderState();
}

class _AvengerDrawerHeaderState extends State<AvengerDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Card(
        elevation: 10,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: Text(
                '${widget.title}',
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )),
              Container(
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  shape: CircleBorder(
                      side: BorderSide(
                    color: Colors.grey[500],
                    width: 2,
                  )),
                  child: FadeInImage.assetNetwork(
                    width: widget.avatarSize,
                    height: widget.avatarSize,
                    placeholder: 'assets/images/ic_app_placeholder.png',
                    image: '${widget.avatar}',
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                    fadeInCurve: Curves.linear,
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
