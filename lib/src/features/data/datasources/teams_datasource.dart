import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/data/models/team_model.dart';
import 'package:footScore/src/features/domain/entities/team_entity.dart';
import 'package:http/http.dart' as http;

abstract class TeamDataSource {
  Future<List<TeamEntity>> getTeamsByLeague(int leagueId);
}

class TeamsRemoteDataSource implements TeamDataSource {
  final http.Client client;
  final String apiKey =
      '64fe8f0191a6bce2b584947e7b6ad092401fe4a372adb602f7a887ae9578cb5e';
  TeamsRemoteDataSource({@required this.client});

  // fetch method
  Future<List<TeamEntity>> getTeamsByLeague(int leagueId) async {
    try {
      // fetching data
      final response = await client.get(
          "https://allsportsapi.com/api/football/?met=Teams&leagueId=$leagueId&APIkey=$apiKey",
          headers: <String, String>{'Content-Type': 'application/json'});
      final data = await jsonDecode(response.body);
      if (data['error'] == 1) throw new Exception();
      return TeamModel.toList(data['result']);
    } catch (e) {
      throw new Exception();
    }
  }
}
