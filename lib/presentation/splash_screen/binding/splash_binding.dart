import 'package:get/get.dart';
import 'package:task/presentation/splash_screen/controller/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> SplashController());
  }
  
}