part of 'lotomania_bloc.dart';

abstract class LotomaniaState extends Equatable {
  const LotomaniaState();

  @override
  List<Object> get props => [];
}

class LotomaniaInitial extends LotomaniaState {}

class LotomaniaLoading extends LotomaniaState {}

class LotomaniaLoaded extends LotomaniaState {
  final Lotomania lotomaniaModel;
  const LotomaniaLoaded(this.lotomaniaModel);
}

class LotomaniaError extends LotomaniaState {
  final String message;
  const LotomaniaError(this.message);
}
