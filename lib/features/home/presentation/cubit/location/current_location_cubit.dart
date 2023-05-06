import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/service/hive_service.dart';
part 'current_location_state.dart';

class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  CurrentLocationCubit()
      : super(
          CurrentLocationState(
            errorText: "",
            status: CurrentLocationStatus.initialState,
            locationName: UserLocationsHiveSerive.instance.userLocations
                .getAt(0)!
                .nameLocation,
          ),
        );
  void changeLocationName({required int index}) {
    emit(state.copyWith(
      status: CurrentLocationStatus.selectedState,
      locationName: UserLocationsHiveSerive.instance.userLocations
          .getAt(index)!
          .nameLocation,
    ));
  }
}
