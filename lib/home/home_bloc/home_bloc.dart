import 'package:bloc/bloc.dart';
import 'package:bloc_demo/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'home_state.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(HomeState()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<FetchHomeData>((event, emit) async {
      print("Step 1");
      emit(state.copyWith(isLoading: true, error: null));

      print("Step 2");

      try {
        final data = await repository.fetchHomeData();
        emit(state.copyWith(isLoading: false, items: data));

        print("Step 3");
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: "Something went wrong"));

        print("Step 4");
      }
    });
  }
}
