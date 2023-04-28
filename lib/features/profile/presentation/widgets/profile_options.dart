import 'package:ploff_kebab/export_files.dart';

class ProfileOptionsItem extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onTap;
  final bool isDivider;
  const ProfileOptionsItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.isDivider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: isDivider
              ? Border(
                  bottom: BorderSide(
                    color: AppColors.black.withOpacity(.01),
                  ),
                )
              : null),
      child: ListTile(
        tileColor: AppColors.white,
        onTap: onTap,
        leading: SvgPicture.asset(icon),
        title: Text(
          title,
          style: AppTextsyles.w500.copyWith(fontSize: 16.0.sp),
        ),
        trailing: SvgPicture.asset(AppIcons.arrowRight),
      ),
    );
  }
}
