import 'package:flutter/cupertino.dart';
import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/core/widgets/dialogs/delete_dialogs.dart';
import 'package:ploff_kebab/export_files.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with CacheMixin {
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF0F0F0,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Center(
            child: SvgPicture.asset(
              AppIcons.arrowBack,
              width: 7.w,
              height: 13.h,
            ),
          ),
        ),
        title: Text(
          "Settings",
          style: AppTextsyles.w600.copyWith(fontSize: 20.0.sp),
        ),
      ),
      body: Padding(
        padding: AppUtils.kPaddingAll16,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.globus),
                    title: Text(
                      "Language",
                      style: AppTextsyles.w500.copyWith(fontSize: 18.sp),
                    ),
                    tileColor: AppColors.cF0F0F0,
                    onTap: () {
                      languageBottomDialog(context);
                    },
                    trailing: IconButton(
                      onPressed: () {
                        languageBottomDialog(context);
                      },
                      icon: SvgPicture.asset(AppIcons.arrowRight),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    leading: SvgPicture.asset(AppIcons.notification),
                    title: Text(
                      "Notification",
                      style: AppTextsyles.w500.copyWith(fontSize: 18.sp),
                    ),
                    tileColor: AppColors.cF0F0F0,
                    trailing: CupertinoSwitch(
                      activeColor: AppColors.cFFCC00,
                      value: isNotificationOn,
                      onChanged: (value) {
                        setState(() => {
                              isNotificationOn = value,
                            });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: AppUtils.kPaddingAll16,
        child: ElevatedButton(
          autofocus: true,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r)),
            // disabledBackgroundColor: AppColors.white,
            backgroundColor: AppColors.white,
            minimumSize: Size(200.w, 52.h),
            maximumSize: Size(200.w, 52.h),
          ),
          onPressed: () {
            myCustomDialog(
                context: context,
                onTap: () {
                  localSource.setProfile(false);
                  Navigator.pushNamedAndRemoveUntil(
                      context, RouteNames.main, (route) => false);
                },
                asktext: "Are you sure?\n Do you want to delete your account?");
          },
          child: Center(
            child: Text(
              "Log out",
              style: AppTextsyles.w500
                  .copyWith(color: AppColors.red, fontSize: 15),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> languageBottomDialog(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0.r),
          topRight: Radius.circular(10.0.r),
        ),
      ),
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.0.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 5.0.h),
            child: Text(
              "Language",
              style: AppTextsyles.w600.copyWith(fontSize: 20.0.sp),
            ),
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(AppImages.uzbFlag),
            title: Text(
              "O'zbekcha",
              style: AppTextsyles.w600.copyWith(fontSize: 15.0.sp),
            ),
            onTap: () async {
              // if (context.locale.languageCode != "uz") {
              //   context
              //       .read<ChangeLanguageCubit>()
              //       .changeLanguage(languageCode: context.locale.languageCode);
              //   await context.setLocale(const Locale("uz", "UZ"));
              //   await SharedPreferencesService.instance.sharedPreferences
              //       .setString("lan", "uz");
              // }
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(AppImages.russiaFlag),
            title: Text(
              "Русский",
              style: AppTextsyles.w600.copyWith(fontSize: 15.0.sp),
            ),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            leading: Image.asset(AppImages.englishFlag),
            title: Text(
              "English",
              style: AppTextsyles.w600.copyWith(fontSize: 15.0.sp),
            ),
            onTap: () async {
              Navigator.pop(context);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
