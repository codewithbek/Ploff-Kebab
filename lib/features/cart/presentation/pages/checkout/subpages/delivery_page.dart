import 'package:ploff_kebab/core/enums/app_enums.dart';
import 'package:ploff_kebab/core/widgets/textfields/address_text_field.dart';
import 'package:ploff_kebab/core/widgets/textfields/mini_text_field.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/cart/presentation/pages/checkout/widgets/check_item.dart';
import 'package:ploff_kebab/features/cart/presentation/pages/checkout/widgets/select_options.dart';
import 'package:ploff_kebab/features/cart/presentation/pages/checkout/widgets/select_payment.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// ignore: must_be_immutable
class DeliveryPage extends StatefulWidget {
  final TextEditingController entranceController;

  final TextEditingController floorController;

  final TextEditingController flatController;
  final TextEditingController addressController;
  PaymentType? paymentType = PaymentType.Cash;
  DeliveryMethod? deliveryMethod = DeliveryMethod.Express;
  CourierCall? courierCall = CourierCall.Yes;
  bool isEnabled = false;
  final ValueChanged courierValueChanged;
  final ValueChanged deliverValueChanged;
  final ValueChanged paymenValueChanged;

  DeliveryPage({
    super.key,
    required this.entranceController,
    required this.floorController,
    required this.flatController,
    required this.courierValueChanged,
    required this.courierCall,
    required this.deliveryMethod,
    required this.paymentType,
    required this.deliverValueChanged,
    required this.isEnabled,
    required this.paymenValueChanged,
    required this.addressController,
  });

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  late YandexMapController yController;
  static final Point _point = Point(latitude: 41.2995, longitude: 69.2401);

  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  late final List<MapObject> mapObjects = [
    PlacemarkMapObject(
      mapId: cameraMapObjectId,
      point: _point,
      icon: PlacemarkIcon.single(
        PlacemarkIconStyle(
            image: BitmapDescriptor.fromAssetImage(AppImages.position),
            scale: 0.75),
      ),
      opacity: 1.5,
    )
  ];

  final MapObjectId cameraMapObjectId = MapObjectId('camera_placemark');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 16.0.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: AppColors.white,
                  ),
                  padding: EdgeInsets.all(16.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Address",
                        style: AppTextsyles.w600.copyWith(fontSize: 16.0.sp),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Current Address",
                        style: AppTextsyles.w400.copyWith(
                          fontSize: 15.0.sp,
                          color: AppColors.black.withOpacity(.5),
                        ),
                      ),
                      AddressTextFields(
                        isEnabled: true,
                        addressController: widget.addressController,
                      ),
                      Row(
                        children: [
                          MiniTextFields(
                            hintText: "Entrance",
                            controller: widget.entranceController,
                          ),
                          MiniTextFields(
                            hintText: "Floor",
                            controller: widget.floorController,
                          ),
                          MiniTextFields(
                            hintText: "Flat",
                            controller: widget.flatController,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 180.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Stack(
                            children: [
                              YandexMap(
                                mapType: MapType.map,
                                scrollGesturesEnabled: false,
                                onMapCreated: (YandexMapController
                                    yandexMapController) async {
                                  yController = yandexMapController;
                                },
                                mapObjects: mapObjects,
                                onCameraPositionChanged:
                                    (CameraPosition cameraPosition,
                                        CameraUpdateReason _, bool __) async {
                                  final placemarkMapObject =
                                      mapObjects.firstWhere((el) =>
                                              el.mapId == cameraMapObjectId)
                                          as PlacemarkMapObject;

                                  setState(() {
                                    mapObjects[mapObjects
                                            .indexOf(placemarkMapObject)] =
                                        placemarkMapObject.copyWith(
                                            point: cameraPosition.target);
                                  });
                                },
                              ),
                              Positioned(
                                top: 8,
                                left: 8,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(36.w, 36.w),
                                    maximumSize: Size(36.w, 36.w),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: SvgPicture.asset(
                                    AppIcons.big,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                right: 8,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size(36.w, 36.w),
                                    maximumSize: Size(36.w, 36.w),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.sp),
                                    ),
                                  ),
                                  onPressed: () async {
                                    yController.moveCamera(
                                      CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                          target: _point,
                                        ),
                                      ),
                                      animation: animation,
                                    );
                                  },
                                  child: SvgPicture.asset(
                                    AppIcons.navigator,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        "My addresses",
                        style: AppTextsyles.w400.copyWith(fontSize: 15.sp),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: AddressTextFields(
                          isEnabled: false,
                          addressController: widget.addressController,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0.h),
                  padding: EdgeInsets.all(16.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: AppColors.white,
                  ),
                  child: SelectOptions(
                    firstOnTap: widget.courierValueChanged,
                    secondOnTap: widget.courierValueChanged,
                    firstGroupValue: widget.courierCall,
                    firstValue: CourierCall.Yes,
                    secondGroupValue: widget.courierCall,
                    secondValue: CourierCall.No,
                    firstSelect: "Yes",
                    secondSelect: "No",
                    title: "Would you like a courier to call you?",
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0.h),
                  padding: EdgeInsets.all(16.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: AppColors.white,
                  ),
                  child: SelectOptions(
                    firstOnTap: widget.deliverValueChanged,
                    secondOnTap: widget.deliverValueChanged,
                    firstGroupValue: widget.deliveryMethod,
                    firstValue: DeliveryMethod.Express,
                    secondGroupValue: widget.deliveryMethod,
                    secondValue: DeliveryMethod.Scheduled,
                    firstSelect: "Express delivery",
                    secondSelect: "Secheduled delivery",
                    title: "Delivery method",
                  ),
                ),
              ),
              SliverToBoxAdapter(
                  child: SelectPaymentType(
                valueChanged: widget.paymenValueChanged,
                paymentType: widget.paymentType,
              )),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0.h),
                  padding: EdgeInsets.all(16.0.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0.r),
                    color: AppColors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Check",
                        style: AppTextsyles.w600.copyWith(
                          fontSize: 17.0.sp,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ...List.generate(
                        5,
                        (index) => Column(
                          children: [
                            const CheckItem(
                              item: "Shipping amount",
                              price: '2300 sum',
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Text(
                              "Total amount",
                              style: AppTextsyles.w600.copyWith(
                                color: AppColors.black,
                                fontSize: 17.0.sp,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "95000",
                              style: AppTextsyles.w600.copyWith(
                                color: AppColors.black,
                                fontSize: 17.0.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
