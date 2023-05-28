import 'package:dio/dio.dart';
import 'package:test1/core/network/api_helper.dart';
import 'package:test1/features/data/datasources/remote/remote_datasource.dart';
import 'package:test1/features/data/model/response/show_data_model.dart';
import 'package:test1/utils/app_constant.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  ApiHelper apiHelper;

  RemoteDataSourceImpl({required this.apiHelper});

  @override
  Future<ShowDataModel> getShowList() async {
    try {
      Response response = await apiHelper.get(AppConstant.url);
      return ShowDataModel.fromJson(response.data);
    } on Exception {
      rethrow;
    }
  }
}
