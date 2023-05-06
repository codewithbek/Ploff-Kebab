part of 'current_location_cubit.dart';

class CurrentLocationState extends Equatable {
  const CurrentLocationState({
    required this.status,
    required this.errorText,
    required this.locationName,
  });
  final String errorText;
  final String locationName;
  final CurrentLocationStatus status;
  CurrentLocationState copyWith({
    String? errorText,
    CurrentLocationStatus? status,
    String? locationName,
  }) =>
      CurrentLocationState(
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
        locationName: locationName ?? this.locationName,
      );
  @override
  List<Object> get props => [];
}

enum CurrentLocationStatus {
  initialState,
  selectedState,
}
