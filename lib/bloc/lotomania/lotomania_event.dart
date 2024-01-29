part of 'lotomania_bloc.dart';

abstract class LotomaniaEvent extends Equatable {
  const LotomaniaEvent();

  @override
  List<Object> get props => [];
}

class GetLotomaniaList extends LotomaniaEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetLotomaniaList(this.concurso);
}
