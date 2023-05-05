part of 'current_location_cubit.dart';

abstract class CurrentLocationState extends Equatable {
  const CurrentLocationState();
}

class CurrentLocationInitial extends CurrentLocationState {
  @override
  List<Object> get props => [];
}
