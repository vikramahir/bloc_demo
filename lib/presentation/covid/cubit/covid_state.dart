part of 'covid_cubit.dart';

sealed class CovidState extends Equatable {
  const CovidState();

  @override
  List<Object> get props => [];
}

final class CovidInitialState extends CovidState {
  const CovidInitialState();

  @override
  List<Object> get props => [];
}

final class CovidLoadingState extends CovidState {
  const CovidLoadingState();

  @override
  List<Object> get props => [];
}

final class CovidLoadedState extends CovidState {
  final AnimalData animalData;

  const CovidLoadedState({required this.animalData});

  @override
  List<Object> get props => [animalData];
}

final class CovidErorState extends CovidState {
  final String errrorMessage;

  const CovidErorState({required this.errrorMessage});

  @override
  List<Object> get props => [errrorMessage];
}
