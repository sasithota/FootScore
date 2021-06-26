import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:footScore/src/features/data/models/team_detail_model.dart';
import 'package:footScore/src/features/domain/entities/team_detail_entity.dart';
import 'package:footScore/src/helpers/api_helper.dart';
import 'package:http/http.dart' as http;

abstract class TeamDetailDataSource {
  Future<TeamDetailEntity> getTeamDetails(int teamId);
}

class TeamDetailDataSourceImpl implements TeamDetailDataSource {
  final http.Client client;
  ApiHelper apiHelper = ApiHelper();
  TeamDetailDataSourceImpl({@required this.client});

  // return team details;
  Future<TeamDetailEntity> getTeamDetails(int teamId) async {
    try {
      final url = this.apiHelper.get_team_details_url(teamId);
      print(url);
      final response = await client.get(url);
      final data = await jsonDecode(response.body);

      if (data['error'] == '1') throw new Exception();
      return TeamDetailModel.fromJson(data['result'][0]);
    } catch (e) {
      print(e);
      throw new Exception();
    }
  }
}
