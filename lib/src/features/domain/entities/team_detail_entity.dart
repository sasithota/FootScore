import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/domain/entities/player_entity.dart';

class TeamDetailEntity {
  final int id;
  final String name;
  final String logo;
  final List<PlayerEntity> players;
  TeamDetailEntity(
      {@required this.id,
      @required this.name,
      @required this.logo,
      @required this.players});
}
