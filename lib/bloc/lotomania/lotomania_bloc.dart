// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:loterias_caixa/model/lotomania_model.dart';
import 'package:loterias_caixa/resources/api_repository.dart';
part 'lotomania_state.dart';
part 'lotomania_event.dart';

class LotomaniaBloc extends Bloc<LotomaniaEvent, LotomaniaState> {
  LotomaniaBloc() : super(LotomaniaInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetLotomaniaList>((event, emit) async {
      try {
        emit(LotomaniaLoading());
        final mList = await apiRepository.getResultadoLotomania(event.concurso);
        emit(LotomaniaLoaded(mList));
        if (mList.error != "") {
          emit(LotomaniaError(mList.error));
        }
        // emit(HomeError(mList.error));
      } on NetworkError {
        emit(const LotomaniaError(
            "Failed to fetch data. is your device online?"));
      }
    });
  }
}
