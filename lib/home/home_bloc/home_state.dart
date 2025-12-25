import 'package:equatable/equatable.dart';

import '../../model/home_model.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final List<HomeItem> items;
  final String? error;

  const HomeState({
    this.isLoading = false,
    this.items = const [],
     this.error,
  });

  HomeState copyWith({
    final bool? isLoading,
    final List<HomeItem>? items,
    final String? error,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      items: items ?? this.items,
      error: error ?? this.error,
    );
  }


  @override
  List<Object?> get props => [isLoading, items, error];
}
