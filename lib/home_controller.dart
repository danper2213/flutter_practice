import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    testState();
  }

  void testState() async {
    change(null, status: RxStatus.loading());
    await Future.delayed(Duration(seconds: 3));
    change(null, status: RxStatus.success());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
