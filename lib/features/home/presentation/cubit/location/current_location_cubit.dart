import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  CurrentLocationCubit() : super(CurrentLocationInitial());
}
