import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/data/datasources/teams_datasource.dart';
import 'package:footScore/src/utils/exceptions/errors.dart';
import 'package:footScore/src/utils/functions/internet_connection.dart';
import '../entities/team_entity.dart';

///
///repository for list of teams
///
///uses `TeamDataSource` as datasource
///
/// returns future of `List<TeamEntity>`
///
class TeamRepository {
  ///
  /// datasource for `List<TeamEntity>`
  ///
  final TeamDataSource dataSource;

  /// constructor for `TeamRepository`
  ///
  TeamRepository({@required this.dataSource});

  ///
  ///returns `List<TeamEntity>` or throws an error
  ///
  Future<List<TeamEntity>> getTeams(int leagueId) async {
    try {
      /// checks internet connection
      await connectionChecker();

      /// return `List<TeamEnitity>`
      return await dataSource.getTeamsByLeague(leagueId);
    } on InternetFailure {
      /// error on [internet connection]
      throw new ErrorDescription("No internet connection !!!");
    } catch (e) {
      /// error on [server exceptions]
      throw new ErrorDescription(e.toString());
    }
  }
}
