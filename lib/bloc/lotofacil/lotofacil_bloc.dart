// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:loterias_caixa/model/lotofacil_model.dart';
import 'package:loterias_caixa/resources/api_repository.dart';
part 'lotofacil_state.dart';
part 'lotofacil_event.dart';

class LotofacilBloc extends Bloc<LotofacilEvent, LotofacilState> {
  LotofacilBloc() : super(LotofacilInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetLotofacilList>((event, emit) async {
      try {
        emit(LotofacilLoading());
        final mList = await apiRepository.getResultadoLotofacil(event.concurso);
        emit(LotofacilLoaded(mList));
        if (mList.error != "") {
          emit(HomeError(mList.error));
        }
        // emit(HomeError(mList.error));
      } on NetworkError {
        emit(const HomeError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
