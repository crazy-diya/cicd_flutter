import 'package:test1/core/network/network_info.dart';
import 'package:test1/features/data/datasources/remote/remote_datasource.dart';
import 'package:test1/features/data/model/response/show_data_model.dart';
import 'package:test1/features/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource remoteDataSource;
  NetworkInfo networkInfo;

  RepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<ShowDataModel> getShowList() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getShowList();
        return response;
      } on Exception {
        rethrow;
      }
    } else {
      throw "Connection failure";
    }
  }
}
