import 'package:geocoding/geocoding.dart';
import 'package:ploff_kebab/core/widgets/textfields/mini_text_field.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/user_locations.dart';
import 'package:ploff_kebab/service/hive_service.dart';
import 'package:ploff_kebab/service/location_service.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  final TextEditingController entranceController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController flatController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  LocationService locationService = LocationService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      backgroundColor: AppColors.cF0F0F0,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: Stack(
              children: [
                YandexMap(),
                Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(AppIcons.locationCenter))
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * .45,
              padding: EdgeInsets.all(10.0.r),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Container(
                      height: 5.0.h,
                      width: 40.0.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.cF0F0F0,
                      ),
                    ),
                  ),
                  Text(
                    "Delivery address",
                    style: AppTextsyles.w600.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(height: 15.h),
                  TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      fillColor: AppColors.cF0F0F0,
                      filled: true,
                      hintText:
                          "${locationService.placemark?[0].administrativeArea}, ${locationService.placemark?[0].locality}",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  Row(
                    children: [
                      MiniTextFields(
                        hintText: "Entrance",
                        controller: entranceController,
                      ),
                      MiniTextFields(
                        hintText: "Floor",
                        controller: floorController,
                      ),
                      MiniTextFields(
                        hintText: "Flat",
                        controller: flatController,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.cF0F0F0,
                      hintText: "Address name",
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const Spacer(),
                  PrimaryButtonWidget(
                    text: "Confirm",
                    onTap: () {
                      if (addressController.text.isEmpty ||
                          (locationService.placemark?[0].administrativeArea) ==
                                  null &&
                              (locationService.placemark?[0].locality) ==
                                  null) {
                        LocationService.showFailedSnackBar(
                            "Please fill the fields", context);
                      } else {
                        UserLocationsHiveSerive.instance.addLocationToStorage(
                          UserLocations(
                            address: (locationService
                                    .placemark?[0].administrativeArea)! +
                                (locationService.placemark?[0].locality)!,
                            nameLocation: addressController.text,
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
