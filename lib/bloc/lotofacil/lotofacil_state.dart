part of 'lotofacil_bloc.dart';

abstract class LotofacilState extends Equatable {
  const LotofacilState();

  @override
  List<Object> get props => [];
}

class LotofacilInitial extends LotofacilState {}

class LotofacilLoading extends LotofacilState {}

class LotofacilLoaded extends LotofacilState {
  final Lotofacil lotofacilModel;
  const LotofacilLoaded(this.lotofacilModel);
}

class HomeError extends LotofacilState {
  final String message;
  const HomeError(this.message);
}
