import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/domain/entities/team_detail_entity.dart';

abstract class TeamDetailBlocState {
  final TeamDetailEntity team;
  final String error;
  TeamDetailBlocState({this.team, this.error});
}

///Loading State
///
class LoadingTeamDetailState extends TeamDetailBlocState {}

/// data loaded State
///
class LoadedTeamDetailState extends TeamDetailBlocState {
  final TeamDetailEntity team;
  LoadedTeamDetailState({@required this.team})
      : assert(team != null),
        super(team: team);
}

/// error state
class ErrorTeamDetailState extends TeamDetailBlocState {
  final String error;
  ErrorTeamDetailState({this.error}) : super(error: error);
}
