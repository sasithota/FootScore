import 'package:flutter/cupertino.dart';

class League {
  final int id;
  final String country;
  final String logo;
  final String name;
  League(
      {@required this.id,
      @required this.country,
      @required this.logo,
      @required this.name});
}

final leagueList = <League>[
  League(
      id: 468,
      country: 'Spain',
      logo: "https://allsportsapi.com/logo/logo_leagues/468_laliga.png",
      name: 'La Liga'),
  League(
      id: 148,
      country: 'England',
      logo: "https://allsportsapi.com/logo/logo_leagues/148_premier-league.png",
      name: "Premier League"),
  League(
      id: 195,
      country: 'Germany',
      logo: "https://allsportsapi.com/logo/logo_leagues/195_bundesliga.png",
      name: 'Bundesliga'),
  League(
      id: 262,
      country: 'Italy',
      logo: "https://allsportsapi.com/logo/logo_leagues/262_serie-a.png",
      name: 'Serie A'),
  League(
      id: 176,
      country: 'France',
      logo: 'https://allsportsapi.com/logo/logo_leagues/176_ligue-1.png',
      name: 'Ligue 1'),
];
