import 'package:flutter/cupertino.dart';

/// Entity for individual [Player]
///
class PlayerEntity {
  /// id returned by the server
  ///
  /// can be used as api endpoint parameter
  ///
  final int id;

  /// name of the player
  ///
  /// can be used as api endpoin parameter
  final String name;

  /// position of the [Player] like [striker],[midfielder],[defender]
  final String position;

  PlayerEntity(
      {@required this.id, @required this.name, @required this.position});
}
