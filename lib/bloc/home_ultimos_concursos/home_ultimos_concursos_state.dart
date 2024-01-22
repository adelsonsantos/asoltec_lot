part of 'home_ultimos_concursos_bloc.dart';

abstract class HomeUltimosConcursosState extends Equatable {
  const HomeUltimosConcursosState();

  @override
  List<Object> get props => [];
}

class Initial extends HomeUltimosConcursosState {}

class Loading extends HomeUltimosConcursosState {}

class Loaded extends HomeUltimosConcursosState {
  final List<Megasena> megaSenaModel;
  const Loaded(this.megaSenaModel);
}

class LoadedLotofacil extends HomeUltimosConcursosState {
  final List<Lotofacil> lotofacilModel;
  const LoadedLotofacil(this.lotofacilModel);
}

class Error extends HomeUltimosConcursosState {
  final String message;
  const Error(this.message);
}
