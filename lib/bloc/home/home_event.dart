part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetMegaSenaList extends HomeEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetMegaSenaList(this.concurso);
}
