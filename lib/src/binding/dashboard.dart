import 'package:fitness_app/src/controller/helth_repo.dart';
import 'package:get/get.dart';

class DashBoard extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelthRepo());
  }
}
