import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test1/core/network/api_helper.dart';
import 'package:test1/core/network/network_info.dart';
import 'package:test1/features/domain/usecase/show_list_usecase.dart';
import 'package:test1/features/presentation/bolc/show_list/show_list_bloc.dart';

import '../../features/data/datasources/remote/remote_datasource.dart';
import '../../features/data/datasources/remote/remote_datasource_impl.dart';
import '../../features/data/repository/repository_impl.dart';
import '../../features/domain/repository/repository.dart';

final injection = GetIt.instance;

Future<void> init() async {
  injection.registerSingleton(Dio());
  injection.registerSingleton(ApiHelper(dio: injection.call()));
  injection.registerSingleton(Connectivity());
  injection.registerSingleton<NetworkInfo>(NetworkInfoImpl(injection.call()));

  // Repository
  injection.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: injection.call(),
      networkInfo: injection.call(),
    ),
  );
  // Remote Data source
  injection.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      apiHelper: injection.call(),
    ),
  );
  // Bloc
  injection.registerFactory(
    () => ShowListBloc(
      showListUseCase: injection.call(),
    ),
  );
  // UseCase
  injection.registerLazySingleton(
    () => ShowListUseCase(
      repository: injection.call(),
    ),
  );
}
