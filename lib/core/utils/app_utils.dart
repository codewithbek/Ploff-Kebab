import 'package:ploff_kebab/export_files.dart';

class AppUtils {
  AppUtils._();

  /// box
  static const kGap = Gap(0);
  static const kGap2 = Gap(2);
  static const kGap4 = Gap(4);
  static const kGap6 = Gap(6);
  static const kGap8 = Gap(8);
  static const kGap12 = Gap(12);
  static const kGap16 = Gap(16);
  static const kGap24 = Gap(24);
  static const kGap32 = Gap(32);
  static const kGap40 = Gap(40);

  static const kBoxWidth4 = SizedBox(width: 4);
  static const kBoxWidth8 = SizedBox(width: 8);
  static const kBoxWidth12 = SizedBox(width: 12);
  static const kBoxWidth16 = SizedBox(width: 16);
  static const kBoxWidth24 = SizedBox(width: 24);
  static const kBoxWidth32 = SizedBox(width: 32);
  static const kBoxHeight4 = SizedBox(height: 4);
  static const kBoxHeight8 = SizedBox(height: 8);
  static const kBoxHeight12 = SizedBox(height: 12);
  static const kBoxHeight16 = SizedBox(height: 16);
  static const kBoxHeight24 = SizedBox(height: 24);

  /// divider
  static const kDivider = Divider(height: 1, thickness: 1);
  static const kPad16Divider = Padding(
    padding: EdgeInsets.only(left: 16),
    child: Divider(height: 1, thickness: 1),
  );
  static const kPadHor16Divider = Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Divider(height: 1, thickness: 1),
  );

  /// spacer
  static const kSpacer = Spacer();

  /// padding
  static const kPaddingAll4 = EdgeInsets.all(4);
  static const kPaddingAll6 = EdgeInsets.all(6);
  static const kPaddingAll8 = EdgeInsets.all(8);
  static const kPaddingAll12 = EdgeInsets.all(12);
  static const kPaddingAll14 = EdgeInsets.all(14);
  static const kPaddingAll16 = EdgeInsets.all(16);
  static const kPaddingAllB16 = EdgeInsets.fromLTRB(16, 16, 16, 0);
  static const kPaddingBottom2 = EdgeInsets.fromLTRB(0, 0, 0, 2);
  static const kPaddingAll24 = EdgeInsets.all(24);
  static const kPaddingHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const kPaddingVertical12 = EdgeInsets.symmetric(vertical: 12);

  static const kPaddingVertical16 = EdgeInsets.symmetric(vertical: 16);
  static const kPaddingHor32Ver20 =
      EdgeInsets.symmetric(horizontal: 32, vertical: 20);
  static const kPaddingHor16Ver12 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const kPaddingHor16Ver8 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  static const kPaddingHor12Ver8 =
      EdgeInsets.symmetric(horizontal: 12, vertical: 8);
  static const kPaddingHor8Ver4 =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const kPaddingLeft12Right6Ver8 =
      EdgeInsets.only(left: 12, right: 6, top: 8, bottom: 8);

  /// border radius
  static const kRadius = Radius.zero;
  static const kRadius8 = Radius.circular(8);
  static const kRadius12 = Radius.circular(12);
  static const kRadius16 = Radius.circular(16);
  static const kBorderRadius = BorderRadius.all(Radius.circular(0));
  static const kBorderRadius2 = BorderRadius.all(Radius.circular(2));
  static const kBorderRadius4 = BorderRadius.all(Radius.circular(4));
  static const kBorderRadius6 = BorderRadius.all(Radius.circular(6));
  static const kBorderRadius8 = BorderRadius.all(Radius.circular(8));
  static const kBorderRadius12 = BorderRadius.all(Radius.circular(12));
  static const kBorderRadius16 = BorderRadius.all(Radius.circular(16));
  static const kBorderRadius32 = BorderRadius.all(Radius.circular(32));
  static const kBorderRadius48 = BorderRadius.all(Radius.circular(48));
  static const kBorderRadius64 = BorderRadius.all(Radius.circular(64));
  static const kBorderBottomRadius12 =
      BorderRadius.vertical(bottom: Radius.circular(12));
  static const kBorderRadiusTop12 =
      BorderRadius.vertical(top: Radius.circular(12));
  static const kBorderBottomRadius24 =
      BorderRadius.vertical(bottom: Radius.circular(24.0));
  static const kBorderTopRadius24 =
      BorderRadius.vertical(top: Radius.circular(24));

  // static const kTabBarBoxDecoration = BoxDecoration(
  //   color: AppColors.bgGrey2,
  //   borderRadius: kBorderRadius8,
  // );
  // static const kTabBarBoxDecorationDark = BoxDecoration(
  //   color: ThemeColors.backgroundDark,
  //   borderRadius: kBorderRadius8,
  // );
  // static const kTabBoxDecoration = BoxDecoration(
  //   color: AppColors.white,
  //   borderRadius: kBorderRadius8,
  // );
  static Size? _currentSize;

  static setCurrentSize(Size u) {
    _currentSize = u;
  }

  static Size get currentSize => _currentSize ?? const Size(375, 812);

  static void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(text, style: TextStyle(fontSize: 18.sp)),
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
