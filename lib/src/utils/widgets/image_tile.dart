import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatefulWidget {
  final String name;
  final String logo;
  final String country;
  final int id;
  ImageTile(
      {@required this.name,
      @required this.logo,
      @required this.country,
      @required this.id});

  @override
  _ImageTileState createState() => _ImageTileState();
}

class _ImageTileState extends State<ImageTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      width: 160.0,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                color: Colors.grey[200],
                image: DecorationImage(
                    image: NetworkImage(widget.logo), fit: BoxFit.contain)),
          ),
        ],
      ),
    );
  }
}
