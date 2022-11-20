import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolistplus/pages/dashboard/dashboard_controller.dart';
import 'package:todolistplus/pages/home/home_page.dart';
import 'package:todolistplus/pages/setting/setting_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [HomePage(), SettingPage()],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items:  [
            _bottomNavigationBarItem(
              icon: CupertinoIcons.home,
              label: 'Home',
            ),
            _bottomNavigationBarItem(
              icon: CupertinoIcons.settings,
              label: 'News',
            ),
          ],
        ),
      );
    });
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
