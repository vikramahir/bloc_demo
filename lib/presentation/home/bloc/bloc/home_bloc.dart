import 'package:bloc/bloc.dart';
import 'package:demo_bloc_currency/core/api/rest_client.dart';
import 'package:demo_bloc_currency/core/utils/common.dart';
import 'package:demo_bloc_currency/model/currency_data.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<GetCurrencyDataEvent>(onConvertData);
  }
  final restClient = RestClient();

  onConvertData(
      GetCurrencyDataEvent getCurrencyDataEvent, Emitter emitter) async {
    emitter.call(const HomeLoadingState());
    final result = await restClient.get(
      path: Common.apiPath,
    );
    Map<String, dynamic> mData = result.data;
    CurrencyData currencyData = CurrencyData.fromJson(mData);
    emitter.call(HomeLoaddedState(currencyData: currencyData));
  }
}
