import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/data/models/team_model.dart';
import 'package:footScore/src/features/domain/entities/team_entity.dart';
import 'package:footScore/src/helpers/api_helper.dart';
import 'package:http/http.dart' as http;

abstract class TeamDataSource {
  Future<List<TeamEntity>> getTeamsByLeague(int leagueId);
}

class TeamsRemoteDataSource implements TeamDataSource {
  final http.Client client;
  ApiHelper apiHelper = ApiHelper();
  TeamsRemoteDataSource({@required this.client});

  // fetch method
  Future<List<TeamEntity>> getTeamsByLeague(int leagueId) async {
    try {
      // fetching data
      final url = this.apiHelper.get_league_details_url(leagueId);
      print(url);
      final response = await client.get(url,
          headers: <String, String>{'Content-Type': 'application/json'});
      final data = await jsonDecode(response.body);

      if (data['error'] == 1) throw new Exception();
      return TeamModel.toList(data['result']);
    } catch (e) {
      throw new Exception();
    }
  }
}
