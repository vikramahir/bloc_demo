part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitialState extends HomeState {
  const HomeInitialState();

  @override
  List<Object> get props => [];
}

final class HomeLoadingState extends HomeState {
  const HomeLoadingState();

  @override
  List<Object> get props => [];
}

final class HomeLoaddedState extends HomeState {
  final CurrencyData currencyData;

  const HomeLoaddedState({required this.currencyData});

  @override
  List<Object> get props => [currencyData];
}

final class HomeErrorState extends HomeState {
  const HomeErrorState();

  @override
  List<Object> get props => [];
}
