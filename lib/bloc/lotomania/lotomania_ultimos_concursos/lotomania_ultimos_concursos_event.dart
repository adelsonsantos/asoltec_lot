part of 'lotomania_ultimos_concursos_bloc.dart';

abstract class LotomaniaUltimosConcursosEvent extends Equatable {
  const LotomaniaUltimosConcursosEvent();

  @override
  List<Object> get props => [];
}

class GetLotomaniaAnteriorList extends LotomaniaUltimosConcursosEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetLotomaniaAnteriorList(this.concurso);
}
