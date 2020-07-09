import 'package:flutter/material.dart';
import 'package:footScore/src/features/blocs/team_detail_bloc/team_detail_bloc_state.dart';
import 'package:footScore/src/utils/widgets/team_tile.dart';

class TeamDetailResult extends StatelessWidget {
  final TeamDetailBlocState state;
  final String logo;
  TeamDetailResult({@required this.state, @required this.logo});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      child: ListView.builder(
          itemCount: state.team.players.length,
          itemBuilder: (context, index) {
            return TeamTile(
                id: state.team.players[index].id,
                name: state.team.players[index].name,
                logo: logo);
          }),
    );
  }
}
