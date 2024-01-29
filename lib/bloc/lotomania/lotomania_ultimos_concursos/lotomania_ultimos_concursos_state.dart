part of 'lotomania_ultimos_concursos_bloc.dart';

abstract class LotomaniaUltimosConcursosState extends Equatable {
  const LotomaniaUltimosConcursosState();

  @override
  List<Object> get props => [];
}

class Initial extends LotomaniaUltimosConcursosState {}

class Loading extends LotomaniaUltimosConcursosState {}

class Loaded extends LotomaniaUltimosConcursosState {
  final List<Lotomania> lotomania;
  const Loaded(this.lotomania);
}

class Error extends LotomaniaUltimosConcursosState {
  final String message;
  const Error(this.message);
}
