import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    testState();
  }

  void testState() async {
    change(null, status: RxStatus.loading());
    await Future.delayed(const Duration(seconds: 5));
    change(null, status: RxStatus.success());
  }
}
