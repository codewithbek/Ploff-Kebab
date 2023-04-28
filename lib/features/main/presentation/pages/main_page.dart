import 'package:ploff_kebab/export_files.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MainBloc, MainState>(
        builder: (_, state) {
          return IndexedStack(
            index: state.menu.index,
            children: const [
              HomePage(),
              CartPage(),
              OrdersPage(),
              ProfilePage(),
            ],
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<MainBloc, MainState>(
        builder: (_, state) {
          return BottomNavigationBar(
              elevation: 0.0,
              backgroundColor: AppColors.white,
              selectedItemColor: AppColors.cFFCC00,
              selectedFontSize: 12.0.sp,
              unselectedFontSize: 12.0.sp,
              currentIndex: state.menu.index,
              type: BottomNavigationBarType.fixed,
              onTap: (index) => changeTap(index),
              landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
              items: [
                _navigationBarItem(
                  label: "Home",
                  icon: AppIcons.home,
                  activIcon: AppIcons.home,
                ),
                _navigationBarItem(
                  label: "Cart",
                  icon: AppIcons.cart,
                  activIcon: AppIcons.cart,
                ),
                _navigationBarItem(
                  label: "My orders",
                  icon: AppIcons.shoppingBag,
                  activIcon: AppIcons.korzina,
                ),
                _navigationBarItem(
                    label: "Profile",
                    icon: AppIcons.user,
                    activIcon: AppIcons.user),
              ]);
        },
      ),
    );
  }

  void changeTap(int index) {
    if (index == context.read<MainBloc>().state.menu.index) return;
    if (index == 2 && !sl<LocalSource>().hasProfile) {
      Navigator.pushNamed(
        context,
        RouteNames.login,
      );
      return;
    }
    if (index == 3 && !sl<LocalSource>().hasProfile) {
      Navigator.pushNamed(
        context,
        RouteNames.login,
      );
      return;
    }
    context
        .read<MainBloc>()
        .add(TabChangeEvent(index: BottomMenu.values[index]));
  }

  BottomNavigationBarItem _navigationBarItem(
          {required String label,
          required String icon,
          required String activIcon}) =>
      BottomNavigationBarItem(
        activeIcon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: SvgPicture.asset(
            icon,
            // ignore: deprecated_member_use
            color: AppColors.cFFCC00,
          ),
        ),
        icon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: SvgPicture.asset(
            icon,
          ),
        ),
        label: label,
        tooltip: label,
      );
}
