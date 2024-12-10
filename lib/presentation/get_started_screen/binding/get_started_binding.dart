import 'package:get/get.dart';
import 'package:task/presentation/get_started_screen/controller/get_started_controller.dart';

class GetStartedBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => GetStartedController());
  }
}
