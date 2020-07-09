import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/domain/entities/player_entity.dart';

class PlayerModel extends PlayerEntity {
  final int id;
  final String name;
  final String position;
  PlayerModel({@required this.id, @required this.name, @required this.position})
      : super(id: id, name: name, position: position);

  factory PlayerModel.fromJson(dynamic json_data) {
    return PlayerModel(
        id: json_data['player_key'] as int,
        name: json_data['player_name'],
        position: json_data['player_type']);
  }

  static List<PlayerModel> toList(dynamic json_data) {
    List<PlayerModel> players = [];
    json_data.forEach((player) {
      PlayerModel temp = PlayerModel.fromJson(player);
      players.add(temp);
    });
    return players;
  }
}
