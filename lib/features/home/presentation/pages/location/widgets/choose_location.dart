import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/presentation/cubit/location/current_location_cubit.dart';
import 'package:ploff_kebab/service/hive_service.dart';
import 'package:ploff_kebab/service/shared_preferences_serive.dart';

Future<dynamic> chooseLocation(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0.r),
        topRight: Radius.circular(10.0.r),
      ),
    ),
    builder: (context) => StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppUtils.kBoxHeight12,
          Center(
            child: Text(
              "My locations",
              style: AppTextsyles.w600.copyWith(fontSize: 20.0.sp),
            ),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                ...List.generate(
                  UserLocationsHiveSerive.instance.userLocations.length,
                  (index) => ListTile(
                    leading: SharedPreferencesService.instance.sharedPreferences
                                .getInt("current_loc_index") ==
                            index
                        ? const Icon(
                            Icons.radio_button_checked,
                            color: AppColors.cFFCC00,
                          )
                        : const Icon(Icons.radio_button_off_outlined),
                    subtitle: Text(
                      UserLocationsHiveSerive.instance.userLocations
                          .getAt(index)!
                          .address,
                    ),
                    title: Text(UserLocationsHiveSerive.instance.userLocations
                        .getAt(index)!
                        .nameLocation),
                    onTap: () => {
                      setState(
                        () => {
                          SharedPreferencesService.instance.sharedPreferences
                              .setInt("current_loc_index", index),
                          context
                              .read<CurrentLocationCubit>()
                              .changeLocationName(index: index)
                        },
                      )
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: AppUtils.kPaddingAll16,
            child: PrimaryButtonWidget(
              text: "Add location",
              onTap: () {
                Navigator.pushNamed(context, RouteNames.location);
              },
            ),
          )
        ],
      );
    }),
  );
}
