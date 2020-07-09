import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footScore/src/features/blocs/team_detail_bloc/team_detail_bloc_event.dart';
import 'package:footScore/src/features/blocs/team_detail_bloc/team_detail_bloc_state.dart';
import 'package:footScore/src/features/domain/entities/team_detail_entity.dart';
import 'package:footScore/src/features/domain/repository/team_detail_repository.dart';

class TeamDetailBloc extends Bloc<TeamDetailBlocEvent, TeamDetailBlocState> {
  final TeamDetailRepository repository;
  TeamDetailBloc({@required this.repository}) : super(LoadingTeamDetailState());

  void fetchTeamDetails(int teamId) {
    add(FetchTeamDetailEvent(teamId: teamId));
  }

  @override
  Stream<TeamDetailBlocState> mapEventToState(
      TeamDetailBlocEvent event) async* {
    ///loading state
    ///
    yield LoadingTeamDetailState();

    if (event is FetchTeamDetailEvent) {
      try {
        /// fetch team details from repository
        final TeamDetailEntity teamDetails =
            await repository.getTeamDetails(event.teamId);
        yield LoadedTeamDetailState(team: teamDetails);
      } catch (e) {
        /// error from repository;
        yield ErrorTeamDetailState(error: e.toString());
      }
    }
  }
}
