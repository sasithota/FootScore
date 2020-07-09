import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footScore/src/features/blocs/teams_bloc/teams_bloc_event.dart';
import 'package:footScore/src/features/blocs/teams_bloc/teams_bloc_state.dart';
import 'package:footScore/src/features/domain/repository/teams_repository.dart';
import 'package:footScore/src/utils/exceptions/errors.dart';

class TeamBloc extends Bloc<TeamsBlocEvent, TeamsBlocState> {
  final TeamRepository repository;
  // initalState at super;
  TeamBloc({@required this.repository}) : super(EmptyTeams());

  // setters
  void fetchTeams(int id) {
    add(LoadTeamsEvent(leagueId: id));
  }

  @override
  Stream<TeamsBlocState> mapEventToState(TeamsBlocEvent event) async* {
    // loading state
    yield LoadingTeams();

    // fetching data from repository
    if (event is LoadTeamsEvent) {
      try {
        final data = await repository.getTeams(event.leagueId);
        // loaded data
        if (data != null)
          yield LoadedTeams(teams: data);
        // empty data
        else
          yield EmptyTeams();
      } catch (e) {
        print(e);
        // error state
        yield ErrorTeams(e.toString());
      }
    }
  }
}
