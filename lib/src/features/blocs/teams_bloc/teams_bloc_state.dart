import 'package:footScore/src/features/domain/entities/team_entity.dart';

// state type
abstract class TeamsBlocState {
  List<TeamEntity> teams;
  String error;
  TeamsBlocState({this.teams, this.error});
}

// Loading state
class LoadingTeams extends TeamsBlocState {}

// data loaded state
class LoadedTeams extends TeamsBlocState {
  List<TeamEntity> teams;
  LoadedTeams({this.teams}) : super(teams: teams);
}

// empty data state
class EmptyTeams extends TeamsBlocState {}

// error state
class ErrorTeams extends TeamsBlocState {
  String error;
  ErrorTeams(this.error) : super(error: error);
}
