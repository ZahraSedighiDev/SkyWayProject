import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final RxInt pageIndex = 0.obs;
  bool get isHome => pageIndex.value == 0;
  final RxInt index = 0.obs;


  void setPage(int index) {
    pageIndex.value = index;
  }
}
 // class HomePage extends StatelessWidget {
 //   const HomePage({super.key});
 //
 //   @override
 //   Widget build(BuildContext context) {
 //     final skyway = Get.put(AuthViewModel());
 //     return Obx(() {
 //       switch (skyway.pageIndex.value) {
 //         case 0 :
 //           return AuthView();
 //        // case 1 :
 //        //   return const B;
 //
 //         default:
 //           return AuthView();
 //       }
 //     }  );}}