part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetCurrencyDataEvent extends HomeEvent {
  final String haveCurrency;
  final String wntCurrency;
  final String amountCurrency;

  const GetCurrencyDataEvent(
      {required this.haveCurrency,
      required this.wntCurrency,
      required this.amountCurrency});

  @override
  List<Object> get props => [haveCurrency, wntCurrency];
}
