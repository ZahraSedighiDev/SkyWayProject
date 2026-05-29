
import 'package:get/get.dart';
import 'package:skywayproject/Features/HomeAuth/View_Model/auth_view_model.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    {
      Get.lazyPut<AuthViewModel>(() => AuthViewModel());
    }
  }}
