import 'package:flutter/cupertino.dart';

class TeamEntity {
  final int id;
  final String name;
  final String logo;
  TeamEntity({@required this.id, @required this.name, @required this.logo})
      : assert(id != null);
}
