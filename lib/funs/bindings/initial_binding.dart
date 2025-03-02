import 'package:get/get.dart';
import 'package:krishak/views/create_bloc/controller/create_bloc_controller.dart';

import '../../views/home/controller/home_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}

class CreateBlocBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateBlocController>(() => CreateBlocController());
  }
}
