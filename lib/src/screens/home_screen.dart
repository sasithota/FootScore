import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footScore/src/features/blocs/teams_bloc/teams_bloc.dart';
import 'package:footScore/src/features/blocs/teams_bloc/teams_bloc_state.dart';
import 'package:footScore/src/utils/widgets/loading_widget.dart';
import 'package:footScore/src/widgets/team_result.dart';
import 'package:footScore/src/widgets/scroll_header.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //
    return Scaffold(
        // screen header
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.25),
          child: ScrollHeader(),
        ),
        // screen result
        body: BlocBuilder<TeamBloc, TeamsBlocState>(builder: (context, state) {
          // loading state
          if (state is LoadingTeams) {
            return LoadingIndicator();
          }
          // Empty team state
          if (state is EmptyTeams) {
            return Container(
              child: Text('no teams'),
            );
          }
          // error state
          if (state is ErrorTeams) {
            return Container(
              child: Text(state.error),
            );
          }
          // loaded team state
          return Result(state: state);
        }));
  }
}
