import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/data/models/player_model.dart';
import 'package:footScore/src/features/domain/entities/team_detail_entity.dart';

class TeamDetailModel extends TeamDetailEntity {
  final int id;
  final String name;
  final String logo;
  final List<PlayerModel> players;
  TeamDetailModel(
      {@required this.id,
      @required this.name,
      @required this.logo,
      @required this.players})
      : super(id: id, name: name, logo: logo, players: players);

  factory TeamDetailModel.fromJson(dynamic data) {
    List<PlayerModel> players = PlayerModel.toList(data['players']);
    return TeamDetailModel(
        id: int.parse(data['team_key']),
        name: data['team_name'],
        logo: data['team_logo'],
        players: players);
  }
}
