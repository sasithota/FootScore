import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/data/models/team_detail_model.dart';
import 'package:footScore/src/features/domain/entities/team_detail_entity.dart';
import 'package:footScore/src/features/domain/entities/team_entity.dart';
import 'package:http/http.dart' as http;

abstract class TeamDetailDataSource {
  Future<TeamDetailEntity> getTeamDetails(int teamId);
}

class TeamDetailDataSourceImpl implements TeamDetailDataSource {
  final http.Client client;
  final String apiKey =
      '64fe8f0191a6bce2b584947e7b6ad092401fe4a372adb602f7a887ae9578cb5e';
  TeamDetailDataSourceImpl({@required this.client});

  // return team details;
  Future<TeamDetailEntity> getTeamDetails(int teamId) async {
    String id = teamId.toString();
    try {
      final response = await client.get(
          "https://allsportsapi.com/api/football/?met=Teams&teamId=$id&APIkey=$apiKey");
      final data = await jsonDecode(response.body);
      if (data['error'] == '1') throw new Exception();
      return TeamDetailModel.fromJson(data['result'][0]);
    } catch (e) {
      print(e);
      throw new Exception();
    }
  }
}
