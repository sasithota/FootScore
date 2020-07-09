import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/data/datasources/team_detail_datasource.dart';
import 'package:footScore/src/features/domain/entities/team_detail_entity.dart';
import 'package:footScore/src/utils/exceptions/errors.dart';
import 'package:footScore/src/utils/functions/internet_connection.dart';

/// repository for team details
///
/// uses `TeamDetailDataSource` as datasource
///
/// returns future of `TeamDetailEntity`
///
class TeamDetailRepository {
  ///
  /// datasource for `TeamDetailEntity`
  ///
  final TeamDetailDataSource dataSource;
  TeamDetailRepository({@required this.dataSource});

  /// returns `TeamDetailEntity` or throws an error
  ///
  Future<TeamDetailEntity> getTeamDetails(int teamId) async {
    try {
      /// checks internt connection
      await connectionChecker();

      /// returns `TeamDetailEntity`
      return await dataSource.getTeamDetails(teamId);
    } on InternetFailure {
      /// error on [internet connection]
      throw new ErrorDescription("No internet connection");
    } catch (e) {
      /// error on [server exceptions]
      throw new ErrorDescription("server error");
    }
  }
}
