// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:loterias_caixa/model/quina_model.dart';

import 'package:loterias_caixa/resources/api_repository.dart';
part 'quina_ultimos_concursos_state.dart';
part 'quina_ultimos_concursos_event.dart';

class QuinaUltimosConcursosBloc
    extends Bloc<QuinaUltimosConcursosEvent, QuinaUltimosConcursosState> {
  QuinaUltimosConcursosBloc() : super(Initial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetQuinaAnteriorList>((event, emit) async {
      try {
        emit(Loading());
        final List<Quina> mListt = [];

        if (event.concurso > 5) {
          int concursoLimite = event.concurso - 4;
          int concursoAnterior = event.concurso - 1;
          for (var concurso = concursoAnterior;
              concurso >= concursoLimite;
              concurso--) {
            final mList = await apiRepository.getResultadoQuina(concurso);
            if (mList.numero > 0) {
              mListt.add(mList);
            }
          }
        }
        emit(Loaded(mListt));
      } on NetworkError {
        emit(const Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
