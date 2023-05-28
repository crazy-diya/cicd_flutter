import '../../data/model/response/show_data_model.dart';

abstract class Repository{
  Future<ShowDataModel> getShowList();
}