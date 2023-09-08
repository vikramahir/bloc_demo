import 'package:bloc/bloc.dart';
import 'package:demo_bloc_currency/core/api/rest_client.dart';
import 'package:demo_bloc_currency/core/utils/common.dart';
import 'package:demo_bloc_currency/model/animal_data.dart';
import 'package:equatable/equatable.dart';

part 'covid_state.dart';

class CovidCubit extends Cubit<CovidState> {
  CovidCubit() : super(const CovidInitialState());
  final restClient = RestClient();

  Future getAnimalsData({required String animalName}) async {
    emit(const CovidLoadingState());

    final result =
        await restClient.get(path: '${Common.apiPathAnimal}$animalName');
    List<dynamic> mList = result.data;
    Map<String, dynamic> mMap = mList[0];

    if (mMap.isNotEmpty) {
      AnimalData animalData = AnimalData.fromJson(mMap);
      emit(CovidLoadedState(animalData: animalData));
    } else {
      emit(CovidErorState(errrorMessage: 'There is no data for $animalName'));
    }
  }
}
