import 'package:get/get.dart';

class AddRecordController extends GetxController {
  var selectedValue = 1.obs;

  void setSelectedValue(int value) {
    selectedValue.value = value;
  }
}