import 'package:get/get.dart';
import 'package:simpleapp/controller/controller.dart';

class Bind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => productcontreoller());
  }
}
