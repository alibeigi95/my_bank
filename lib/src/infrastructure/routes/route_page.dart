import 'package:get/get.dart';
import 'package:my_bank/src/infrastructure/routes/route_name.dart';
import 'package:my_bank/src/pages/add_record/view/add_record.dart';
import 'package:my_bank/src/pages/add_record/commons/add_record_biding.dart';
import 'package:my_bank/src/pages/home_page_records_list/view/home_page_records_list.dart';
import 'package:my_bank/src/pages/login/bindings/login_binding.dart';
import 'package:my_bank/src/pages/login/view/login.dart';

import '../../pages/home_page_records_list/commons/home_page_record_list_binding.dart';

class RoutePages {


  static final List<GetPage> pages = [
    GetPage(
      name: RoutesName.loginPage,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesName.homePageRecordsList,
      page: () => const HomePageRecordsList(),
      binding: HomePageRecordListBinding(),
      children: [
        GetPage(
          name: RoutesName.addRecord,
          page: () => const AddRecord(),
          binding: AddRecordBinding(),

        ),
      ]
    ),

  ];
}
