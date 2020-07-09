import 'package:connectivity/connectivity.dart';
import 'package:footScore/src/features/blocs/team_detail_bloc/team_detail_bloc.dart';
import 'package:footScore/src/features/data/datasources/team_detail_datasource.dart';
import 'package:footScore/src/features/domain/repository/team_detail_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'src/features/blocs/teams_bloc/teams_bloc.dart';
import 'src/features/data/datasources/teams_datasource.dart';
import 'src/features/domain/repository/teams_repository.dart';

final sl = GetIt.I;

void init() {
  // blocs
  sl.registerFactory(() => TeamBloc(repository: sl()));
  sl.registerFactory(() => TeamDetailBloc(repository: sl()));

  // repositories
  sl.registerLazySingleton(() => TeamRepository(dataSource: sl()));
  sl.registerLazySingleton(() => TeamDetailRepository(dataSource: sl()));

  // datasources
  sl.registerLazySingleton<TeamDataSource>(
      () => TeamsRemoteDataSource(client: sl()));
  sl.registerLazySingleton<TeamDetailDataSource>(
      () => TeamDetailDataSourceImpl(client: sl()));

  // external dependencies
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => http.Client());
}
