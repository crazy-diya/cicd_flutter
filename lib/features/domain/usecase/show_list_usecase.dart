import 'package:test1/features/data/model/response/show_data_model.dart';

import '../repository/repository.dart';

class ShowListUseCase {
  Repository repository;

  ShowListUseCase({required this.repository});

  Future<ShowDataModel> call() async {
    return await repository.getShowList();
  }
}
