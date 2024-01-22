part of 'lotofacil_bloc.dart';

abstract class LotofacilEvent extends Equatable {
  const LotofacilEvent();

  @override
  List<Object> get props => [];
}

class GetLotofacilList extends LotofacilEvent {
  // ignore: prefer_typing_uninitialized_variables
  final concurso;
  const GetLotofacilList(this.concurso);
}
