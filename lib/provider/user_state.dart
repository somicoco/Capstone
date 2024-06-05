import 'package:get/get.dart';

class UserState extends GetxController{

  final userList = [].obs;
  final userDocId = ''.obs;

  /// register
  final memberCheckPhone = ''.obs;
  final memberCheckEmail = ''.obs;
  final memberCheckNickname = ''.obs;
  final registerPhone = ''.obs;
  final registerEmail = ''.obs;
  final registerPassword = ''.obs;
  final registerNickname = ''.obs;

  /// user detail
  final interest = [].obs;
  final techStack = [].obs;
  final introduce = ''.obs;
  final gitUrl = ''.obs;
  final blogUrl = ''.obs;

  RxInt a = 1.obs;


  ///
  @override
  void onInit() {
    print('111');
    super.onInit();
  }
  void test() {
    a.value = 2;
  }
}