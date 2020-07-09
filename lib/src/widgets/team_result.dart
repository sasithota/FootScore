import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footScore/src/features/blocs/teams_bloc/teams_bloc.dart';
import 'package:footScore/src/features/blocs/teams_bloc/teams_bloc_state.dart';
import 'package:footScore/src/screens/team_detail_screen.dart';
import 'package:footScore/src/utils/widgets/loading_widget.dart';
import 'package:footScore/src/utils/widgets/team_tile.dart';

class Result extends StatelessWidget {
  final TeamsBlocState state;
  Result({@required this.state});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ListView.builder(
          itemCount: state.teams.length,
          itemBuilder: (context, index) {
            final team = state.teams[index];
            return FlatButton(
              child: TeamTile(id: team.id, name: team.name, logo: team.logo),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TeamDetailScreen(
                            teamId: team.id,
                            name: team.name,
                            logo: team.logo)));
              },
            );
          }),
    );
  }
}
