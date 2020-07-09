import 'package:flutter/material.dart';

class TeamTile extends StatelessWidget {
  final int id;
  final String name;
  final String logo;
  TeamTile({@required this.id, @required this.name, @required this.logo});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.symmetric(vertical: BorderSide(width: 0.1))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 30.0,
          ),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: NetworkImage(logo), fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            width: 50.0,
          ),
          Container(
            child: Text(
              name,
              style: TextStyle(fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
