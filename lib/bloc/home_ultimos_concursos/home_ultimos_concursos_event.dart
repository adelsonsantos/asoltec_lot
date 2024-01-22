part of 'home_ultimos_concursos_bloc.dart';

abstract class HomeUltimosConcursosEvent extends Equatable {
  const HomeUltimosConcursosEvent();

  @override
  List<Object> get props => [];
}

class GetMegaSenaAnteriorList extends HomeUltimosConcursosEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetMegaSenaAnteriorList(this.concurso);
}

class GetLotofacilAnteriorList extends HomeUltimosConcursosEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetLotofacilAnteriorList(this.concurso);
}
