part of 'lotofacil_ultimos_concursos_bloc.dart';

abstract class LotofacilUltimosConcursosEvent extends Equatable {
  const LotofacilUltimosConcursosEvent();

  @override
  List<Object> get props => [];
}

class GetMegaSenaAnteriorList extends LotofacilUltimosConcursosEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetMegaSenaAnteriorList(this.concurso);
}

class GetLotofacilAnteriorList extends LotofacilUltimosConcursosEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetLotofacilAnteriorList(this.concurso);
}
