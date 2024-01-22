// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:loterias_caixa/model/lotofacil_model.dart';

//import 'package:flashentregasmobileflutter/model/entregador_model.dart';
//import 'package:flashentregasmobileflutter/model/financeiro_model.dart';
import 'package:loterias_caixa/model/mega_sena_model.dart';
import 'package:loterias_caixa/resources/api_repository.dart';
part 'home_ultimos_concursos_state.dart';
part 'home_ultimos_concursos_event.dart';

class HomeUltimosConcursosBloc
    extends Bloc<HomeUltimosConcursosEvent, HomeUltimosConcursosState> {
  HomeUltimosConcursosBloc() : super(Initial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetMegaSenaAnteriorList>((event, emit) async {
      try {
        emit(Loading());
        final List<Megasena> mListt = [];

        if (event.concurso > 5) {
          int concursoLimite = event.concurso - 4;
          int concursoAnterior = event.concurso - 1;
          for (var concurso = concursoAnterior;
              concurso >= concursoLimite;
              concurso--) {
            final mList = await apiRepository.getResultadoMegaSena(concurso);
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

    on<GetLotofacilAnteriorList>((event, emit) async {
      try {
        emit(Loading());
        final List<Lotofacil> mListt = [];

        if (event.concurso > 5) {
          int concursoLimite = event.concurso - 4;
          int concursoAnterior = event.concurso - 1;
          for (var concurso = concursoAnterior;
              concurso >= concursoLimite;
              concurso--) {
            final mList = await apiRepository.getResultadoLotofacil(concurso);
            if (mList.numero > 0) {
              mListt.add(mList);
            }
          }
        }
        emit(LoadedLotofacil(mListt));
      } on NetworkError {
        emit(const Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}
