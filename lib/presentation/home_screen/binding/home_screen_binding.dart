import 'package:get/get.dart';
import 'package:task/presentation/home_screen/controller/home_screen_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeScreenController());
  }
}
