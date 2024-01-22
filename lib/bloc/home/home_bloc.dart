// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

//import 'package:flashentregasmobileflutter/model/entregador_model.dart';
//import 'package:flashentregasmobileflutter/model/financeiro_model.dart';
import 'package:loterias_caixa/model/mega_sena_model.dart';
import 'package:loterias_caixa/resources/api_repository.dart';
part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetMegaSenaList>((event, emit) async {
      try {
        emit(HomeLoading());
        final mList = await apiRepository.getResultadoMegaSena(event.concurso);
        emit(HomeLoaded(mList));
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
