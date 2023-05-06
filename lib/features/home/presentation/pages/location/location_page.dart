import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/user_locations.dart';
import 'package:ploff_kebab/features/home/presentation/pages/location/widgets/mini_text_fields.dart';
import 'package:ploff_kebab/service/hive_service.dart';
import 'package:ploff_kebab/service/location_service.dart';

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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.cF0F0F0,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: Stack(
              children: [
                GoogleMap(
                  onCameraMove: (position) async {
                    locationService.placemark = await placemarkFromCoordinates(
                      position.target.latitude,
                      position.target.longitude,
                    );
                    setState(() {});
                  },
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  zoomControlsEnabled: false,
                  onCameraIdle: () {},
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      locationService.position?.latitude ?? 41.3775,
                      locationService.position?.longitude ?? 63.5853,
                    ),
                    zoom: locationService.position != null ? 15 : 5,
                  ),
                ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Container(
                    padding: EdgeInsets.all(10.0.r),
                    decoration: BoxDecoration(
                      color: AppColors.cF0F0F0,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5.h),
                    child: TextField(
                      maxLines: null,
                      maxLength: null,
                      decoration: InputDecoration(
                        hintText:
                            "${locationService.placemark?[0].administrativeArea}, ${locationService.placemark?[0].locality}",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      MiniTextFields(
                        hintText: "entrance",
                        controller: entranceController,
                      ),
                      MiniTextFields(
                        hintText: "floor",
                        controller: floorController,
                      ),
                      MiniTextFields(
                        hintText: "flat",
                        controller: flatController,
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    padding: EdgeInsets.all(10.0.r),
                    decoration: BoxDecoration(
                      color: AppColors.cF0F0F0,
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: TextField(
                      controller: addressController,
                      decoration: InputDecoration(
                        hintText: "Address_name",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const Spacer(),
                  PrimaryButtonWidget(
                    text: "confirm",
                    onTap: () {
                      if (addressController.text.isEmpty ||
                          (locationService.placemark?[0].administrativeArea) ==
                                  null &&
                              (locationService.placemark?[0].locality) ==
                                  null) {
                        LocationService.showFailedSnackBar(
                            "please_fill_fields", context);
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
