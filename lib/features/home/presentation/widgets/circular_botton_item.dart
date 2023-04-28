import 'package:ploff_kebab/export_files.dart';

class CircularButtonItem extends StatelessWidget {
  const CircularButtonItem({Key? key, required this.onTap, required this.icon})
      : super(key: key);
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: AppColors.white.withOpacity(0.5),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: AppColors.black,
        ),
      ),
    );
  }
}
