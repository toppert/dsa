import 'package:get/get.dart';
import 'package:todolistplus/pages/home/home_controller.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}