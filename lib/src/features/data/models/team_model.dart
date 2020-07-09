import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/domain/entities/team_entity.dart';

class TeamModel extends TeamEntity {
  final int id;
  final String name;
  final String logo;
  TeamModel({@required this.id, @required this.name, @required this.logo})
      : super(id: id, name: name, logo: logo);

  factory TeamModel.fromJson(dynamic rawData) {
    return TeamModel(
        id: int.parse(rawData['team_key']),
        name: rawData['team_name'],
        logo: rawData['team_logo']);
  }
  static List<TeamModel> toList(dynamic rawData) {
    List<TeamModel> teamList = [];
    rawData.forEach((val) {
      TeamModel temp = TeamModel.fromJson(val);
      teamList.add(temp);
    });
    return teamList;
  }
}
