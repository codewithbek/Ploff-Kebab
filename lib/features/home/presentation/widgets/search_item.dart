import 'package:ploff_kebab/export_files.dart';

class CustomSearchItem extends StatelessWidget {
  const CustomSearchItem({Key? key, required this.controller, required this.valueChanged}) : super(key: key);
  final TextEditingController controller;
  final ValueChanged valueChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: valueChanged,
      onTap: () async {},
      style: Theme.of(context).textTheme.titleMedium,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.cF5F5F5,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
        contentPadding: AppUtils.kPaddingAll14,
        hintText: "Search food...",
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
      ),
    );
  }
}
