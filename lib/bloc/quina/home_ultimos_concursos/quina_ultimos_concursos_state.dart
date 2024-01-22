part of 'quina_ultimos_concursos_bloc.dart';

abstract class QuinaUltimosConcursosState extends Equatable {
  const QuinaUltimosConcursosState();

  @override
  List<Object> get props => [];
}

class Initial extends QuinaUltimosConcursosState {}

class Loading extends QuinaUltimosConcursosState {}

class Loaded extends QuinaUltimosConcursosState {
  final List<Quina> lotofacil;
  const Loaded(this.lotofacil);
}

class Error extends QuinaUltimosConcursosState {
  final String message;
  const Error(this.message);
}
