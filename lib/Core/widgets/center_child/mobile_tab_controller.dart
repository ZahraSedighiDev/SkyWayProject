import 'package:get/get.dart';

class MobileTabController extends GetxController {

  ///final selectedTab = (-1).obs;
  final Rx<int> selectedTab = Rx<int>(-1);

  void selectTab(int index) {

    if (selectedTab.value == index) {
      selectedTab.value = -1;
    } else {
      selectedTab.value = index;
    }

  }
}
