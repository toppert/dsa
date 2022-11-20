import 'package:get/get.dart';
import 'package:todolistplus/pages/add_new_note/add_new_note_page.dart';
import 'package:todolistplus/pages/dashboard/dashboard_binding.dart';
import 'package:todolistplus/pages/dashboard/dashboard_page.dart';
import 'package:todolistplus/pages/home/home_binding.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.CREATENOTE,
      page: () => AddNewNotePage(),
      binding: HomeBinding(),
    ),
  ];
}
