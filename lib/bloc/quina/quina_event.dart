part of 'quina_bloc.dart';

abstract class QuinaEvent extends Equatable {
  const QuinaEvent();

  @override
  List<Object> get props => [];
}

class GetQuinaList extends QuinaEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetQuinaList(this.concurso);
}
