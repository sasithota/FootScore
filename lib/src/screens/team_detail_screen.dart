import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footScore/src/features/blocs/team_detail_bloc/team_detail_bloc.dart';
import 'package:footScore/src/features/blocs/team_detail_bloc/team_detail_bloc_state.dart';
import 'package:footScore/src/utils/widgets/loading_widget.dart';
import 'package:footScore/src/widgets/team_details_reslut.dart';

class TeamDetailScreen extends StatefulWidget {
  final int teamId;
  final String name;
  final String logo;
  TeamDetailScreen(
      {@required this.teamId, @required this.name, @required this.logo});

  @override
  _TeamDetailScreenState createState() => _TeamDetailScreenState();
}

class _TeamDetailScreenState extends State<TeamDetailScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final provider = BlocProvider.of<TeamDetailBloc>(context);
    print(widget.teamId);
    provider.fetchTeamDetails(widget.teamId);
    return Scaffold(
        appBar: AppBar(
          elevation: 20.0,
          title: Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 60.0,
                ),
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(widget.logo), fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(widget.name)
              ],
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<TeamDetailBloc, TeamDetailBlocState>(
            builder: (context, state) {
          if (state is LoadingTeamDetailState) {
            return LoadingIndicator();
          } else if (state is ErrorTeamDetailState) {
            return Container(child: Text(state.error));
          }
          return TeamDetailResult(state: state, logo: widget.logo);
        }));
  }
}
