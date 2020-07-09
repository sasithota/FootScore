import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footScore/src/features/blocs/team_detail_bloc/team_detail_bloc.dart';
import 'package:footScore/src/features/blocs/teams_bloc/teams_bloc.dart';
import 'package:footScore/src/screens/home_screen.dart';
import 'service_locatior.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<TeamBloc>()),
        BlocProvider(create: (context) => di.sl<TeamDetailBloc>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
