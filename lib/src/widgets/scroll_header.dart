import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footScore/src/features/blocs/teams_bloc/teams_bloc.dart';
import 'package:footScore/src/utils/fixtures/leagues.dart';
import 'package:footScore/src/utils/widgets/image_tile.dart';

class ScrollHeader extends StatefulWidget {
  const ScrollHeader({
    Key key,
  }) : super(key: key);

  @override
  _ScrollHeaderState createState() => _ScrollHeaderState();
}

class _ScrollHeaderState extends State<ScrollHeader> {
  final leaguesList = leagueList;
  @override
  Widget build(BuildContext context) {
    // provider
    // ignore: close_sinks
    TeamBloc provider = BlocProvider.of<TeamBloc>(context);
    //
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 0.3)),
      ),
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: leaguesList.length,
          itemBuilder: (context, index) {
            final item = leaguesList[index];
            return FlatButton(
                focusColor: Colors.red,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: ImageTile(
                    name: item.name,
                    logo: item.logo,
                    country: item.country,
                    id: item.id),
                onPressed: () {
                  print('click');
                  // print(item.id);
                  provider.fetchTeams(item.id);
                });
          }),
    );
  }
}
