part of 'quina_ultimos_concursos_bloc.dart';

abstract class QuinaUltimosConcursosEvent extends Equatable {
  const QuinaUltimosConcursosEvent();

  @override
  List<Object> get props => [];
}

class GetQuinaAnteriorList extends QuinaUltimosConcursosEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetQuinaAnteriorList(this.concurso);
}
