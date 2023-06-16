import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank/src/infrastructure/commons/data_bank.dart';

import '../../shared/model/account.dart';
import '../../shared/model/manager_app.dart';

class HomePageRecordListController extends GetxController {
  Account? account;

  ManagerApp bank =  ManagerApp(records: [], accounts: [
    Account(accountName: 'bitcoin wallet',balanceAccount: 10000,cardColor: Colors.lightGreen),
    Account(accountName: 'polka-dot wallet',balanceAccount: 20000,cardColor: Colors.blueGrey),

  ]);

  @override
  void oninit() {
    super.onInit();
    account = Get.arguments;
  }
}
