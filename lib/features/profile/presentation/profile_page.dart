import 'package:ploff_kebab/core/mixins/cache_mixin.dart';
import 'package:ploff_kebab/export_files.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with CacheMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF0F0F0,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile",
            style: AppTextsyles.w600.copyWith(fontSize: 20.0.sp)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0.h,
            ),
            padding: EdgeInsets.all(16.0.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0.r),
              color: AppColors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localSource.getName().toString(),
                      style: AppTextsyles.w600.copyWith(fontSize: 20.sp),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Text(
                      localSource.getPhone().toString(),
                      style: AppTextsyles.w400.copyWith(
                        fontSize: 15.sp,
                        color: AppColors.black2,
                      ),
                    )
                  ],
                ),
                IconButton(
                  onPressed: () {
                    
                  },
                  icon: SvgPicture.asset(AppIcons.edit),
                )
              ],
            ),
          ),
          ProfileOptionsItem(
            icon: AppIcons.locationBlack,
            title: "Branches",
            onTap: () {},
            isDivider: true,
          ),
          ProfileOptionsItem(
            icon: AppIcons.myLocation,
            title: "My locations",
            onTap: () {},
            isDivider: true,
          ),
          ProfileOptionsItem(
            icon: AppIcons.settings,
            title: "Settings",
            onTap: () {
              Navigator.pushNamed(context, RouteNames.settings);
            },
            isDivider: true,
          ),
          ProfileOptionsItem(
            icon: AppIcons.about,
            title: "About us",
            onTap: () {},
            isDivider: false,
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              localSource.setProfile(false);
              Navigator.pushNamedAndRemoveUntil(
                  context, RouteNames.main, (route) => false);
            },
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10.0.w),
              padding: EdgeInsets.symmetric(vertical: 15.0.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Center(
                child: Text(
                  "Log out",
                  style: AppTextsyles.w500
                      .copyWith(color: AppColors.red, fontSize: 15),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0.h),
          Text(
            "Version 1.0.0",
            style: AppTextsyles.w400
                .copyWith(color: AppColors.c858585, fontSize: 15.sp),
          ),
          SizedBox(height: 16.0.h),
        ],
      ),
    );
  }
}
