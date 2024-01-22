part of 'lotofacil_ultimos_concursos_bloc.dart';

abstract class LotofacilUltimosConcursosState extends Equatable {
  const LotofacilUltimosConcursosState();

  @override
  List<Object> get props => [];
}

class Initial extends LotofacilUltimosConcursosState {}

class Loading extends LotofacilUltimosConcursosState {}

class Loaded extends LotofacilUltimosConcursosState {
  final List<Lotofacil> lotofacil;
  const Loaded(this.lotofacil);
}

class Error extends LotofacilUltimosConcursosState {
  final String message;
  const Error(this.message);
}
