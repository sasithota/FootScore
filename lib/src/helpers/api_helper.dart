import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiHelper {
  final String key = env['API_KEY'];

  String get_base_url() {
    String base = env['BASE_URL'];
    if (base == null) base = 'https://allsportsapi.com/api/football';
    return base;
  }

  String get_team_details_url(int id) {
    /// Method to get url for team details
    return this.get_base_url() + "/?met=Teams&teamId=$id&APIkey=$key";
  }

  String get_league_details_url(int id) {
    /// Method to get url for league details
    return this.get_base_url() + "/?met=Teams&leagueId=$id&APIkey=$key";
  }
}
