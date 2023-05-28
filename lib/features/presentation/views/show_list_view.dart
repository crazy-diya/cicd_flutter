import 'package:flutter/material.dart';
import 'package:test1/core/services/dependency_injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/features/data/model/response/show_data_model.dart';
import '../../../utils/app_colors.dart';
import '../bolc/show_list/show_list_bloc.dart';

class ShowListView extends StatefulWidget {
  const ShowListView({Key? key}) : super(key: key);

  @override
  State<ShowListView> createState() => _ShowListViewState();
}

class _ShowListViewState extends State<ShowListView> {
  final _bloc = injection<ShowListBloc>();
  ShowDataModel? show;

  @override
  void initState() {
    _bloc.add(LoadShowListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ShowListBloc>(
        create: (context) => _bloc,
        child: BlocListener<ShowListBloc, ShowListState>(
          listener: (context, state) {
            if (state is ShowListSuccessfullyLoadedState) {
              setState(() {
                show = state.showDataModel;
              });
            }
          },
          child: Stack(
            children: [
              show != null
                  ? ListView.builder(
                      itemCount: show!.data!.length,
                      itemBuilder: (context, index) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Image.network(show!.data![index].mainImage!),
                          title: Text(show!.data![index].name!),
                          subtitle: Text(show!.data![index].brandName!),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            // Handle tile tap
                          },
                          onLongPress: () {
                            // Handle tile long press
                          },
                          selected: true,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          dense: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          tileColor: Colors.grey[200],
                          enabled: true,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              BlocBuilder<ShowListBloc, ShowListState>(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is ShowListLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 3,
                        color: AppColors.primaryColor,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
