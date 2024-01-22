// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:loterias_caixa/model/quina_model.dart';
import 'package:loterias_caixa/resources/api_repository.dart';
part 'quina_state.dart';
part 'quina_event.dart';

class QuinaBloc extends Bloc<QuinaEvent, QuinaState> {
  QuinaBloc() : super(QuinaInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetQuinaList>((event, emit) async {
      try {
        emit(QuinaLoading());
        final mList = await apiRepository.getResultadoQuina(event.concurso);
        emit(QuinaLoaded(mList));
        if (mList.error != "") {
          emit(QuinaError(mList.error));
        }
        // emit(HomeError(mList.error));
      } on NetworkError {
        emit(const QuinaError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
