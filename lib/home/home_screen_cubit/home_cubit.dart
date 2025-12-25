import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../repository/home_repository.dart';
import '../home_bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository;

  HomeCubit(this.repository) : super(HomeState());

  Future<void> fetchHomeData() async {
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
  }
}
