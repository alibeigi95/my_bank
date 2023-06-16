import 'package:get/get.dart';
import 'package:my_bank/src/pages/home_page_records_list/controller/home_page_record_list_controller.dart';

class HomePageRecordListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageRecordListController());
  }
}
