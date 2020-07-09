import 'package:flutter/cupertino.dart';

abstract class TeamsBlocEvent {}

class LoadTeamsEvent extends TeamsBlocEvent {
  final int leagueId;
  LoadTeamsEvent({@required this.leagueId});
}
