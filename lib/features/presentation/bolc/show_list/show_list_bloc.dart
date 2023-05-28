import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test1/features/data/model/response/show_data_model.dart';

import '../../../domain/usecase/show_list_usecase.dart';

part 'show_list_event.dart';

part 'show_list_state.dart';

class ShowListBloc extends Bloc<ShowListEvent, ShowListState> {
  ShowListUseCase showListUseCase;

  ShowListBloc({required this.showListUseCase}) : super(ShowListInitial()) {
    on<LoadShowListEvent>(getShowList);
  }

  Future<void> getShowList(
      LoadShowListEvent event, Emitter<ShowListState> emit) async {
    emit(ShowListLoadingState());
    try {
      var result = await showListUseCase();
      print("Data is : $result");
      emit(ShowListSuccessfullyLoadedState(showDataModel: result));
    } catch (e) {
      print(e);
    }
  }
}
