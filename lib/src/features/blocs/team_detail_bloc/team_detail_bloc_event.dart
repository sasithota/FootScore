abstract class TeamDetailBlocEvent {
  final int teamId;
  TeamDetailBlocEvent({this.teamId});
}

class FetchTeamDetailEvent extends TeamDetailBlocEvent {
  final int teamId;
  FetchTeamDetailEvent({this.teamId})
      : assert(teamId != null),
        super(teamId: teamId);
}
