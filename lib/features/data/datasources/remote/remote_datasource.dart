import 'package:test1/features/data/model/response/show_data_model.dart';

abstract class RemoteDataSource{
  Future<ShowDataModel> getShowList();
}