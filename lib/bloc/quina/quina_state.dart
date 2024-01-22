part of 'quina_bloc.dart';

abstract class QuinaState extends Equatable {
  const QuinaState();

  @override
  List<Object> get props => [];
}

class QuinaInitial extends QuinaState {}

class QuinaLoading extends QuinaState {}

class QuinaLoaded extends QuinaState {
  final Quina quinaModel;
  const QuinaLoaded(this.quinaModel);
}

class QuinaError extends QuinaState {
  final String message;
  const QuinaError(this.message);
}
