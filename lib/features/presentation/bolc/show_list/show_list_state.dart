part of 'show_list_bloc.dart';

@immutable
abstract class ShowListState {}

class ShowListInitial extends ShowListState {}

class ShowListSuccessfullyLoadedState extends ShowListState {
  ShowDataModel? showDataModel;

  ShowListSuccessfullyLoadedState({this.showDataModel});
}

class ShowListLoadingState extends ShowListState{}
