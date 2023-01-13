import 'package:flutter/material.dart';
import 'package:flutter_core/ui/home/home_screen.dart';
import 'package:flutter_core/ui/incoming/incoming_screen.dart';
import 'package:flutter_core/ui/orders/orders_screen.dart';
import 'package:flutter_core/ui/other/other_screen.dart';
import 'package:flutter_core/ui/sale/sale_screen.dart';
import 'package:flutter_core/util/extensions/theme_extensions.dart';
import 'package:flutter_core/util/service/helper_service/translator.dart';
import 'package:flutter_core/util/theme/colors.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late PersistentTabController _tabController;

  void _changeIndex(int index) {
    _tabController.index = index;
  }

  PersistentBottomNavBarItem _navBarItem({
    required IconData icon,
    required String title,
  }) =>
      PersistentBottomNavBarItem(
        icon: Icon(icon),
        title: title,
        contentPadding: 5,
        textStyle:
            context.currentTheme().bottomNavigationBarTheme.selectedLabelStyle,
        activeColorPrimary: context.currentTheme().indicatorColor,
        activeColorSecondary:
            context.currentTheme().bottomNavigationBarTheme.selectedItemColor ??
                buttonColor,
        inactiveColorPrimary:
            context.currentTheme().bottomNavigationBarTheme.unselectedItemColor,
        inactiveColorSecondary: context
                .currentTheme()
                .bottomNavigationBarTheme
                .unselectedItemColor ??
            appbarColor,
      );

  List<PersistentBottomNavBarItem> _navbarItems() => [
        _navBarItem(
          icon: Icons.home_outlined,
          title: translate("dashboard.home"),
        ),
        _navBarItem(
          icon: Icons.shopping_cart_outlined,
          title: translate("dashboard.sale"),
        ),
        _navBarItem(
          icon: Icons.qr_code,
          title: translate("dashboard.incoming"),
        ),
        _navBarItem(
          icon: Icons.archive_outlined,
          title: translate("dashboard.orders"),
        ),
        _navBarItem(
          icon: Icons.pending_outlined,
          title: translate("dashboard.other"),
        ),
      ];

  final List<Widget> _screens = [
    const HomeScreen(),
    const SaleScreen(),
    const IncomingScreen(),
    const OrdersScreen(),
    const OtherScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = PersistentTabController();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      onItemSelected: _changeIndex,
      screens: _screens,
      controller: _tabController,
      items: _navbarItems(),
      backgroundColor:
          context.currentTheme().bottomNavigationBarTheme.backgroundColor ??
              subtitleColor,
      handleAndroidBackButtonPress: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popActionScreens: PopActionScreensType.all,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
