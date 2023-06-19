import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank/src/infrastructure/commons/data_bank.dart';

import '../../../infrastructure/routes/route_name.dart';
import '../../shared/model/account.dart';
import '../../shared/model/manager_app.dart';
import '../../shared/model/pay_amount.dart';

class HomePageRecordListController extends GetxController {
  RxList<Account> accounts = <Account>[].obs;
  RxList<PaymentRecord> records = <PaymentRecord>[].obs;

  @override
  void onInit() {
    super.onInit();
    accounts.addAll(DataBank.bank.accounts);
    records.addAll(DataBank.bank.records);
  }

  Future<void> goToAddPage() async {
    final result = await Get.toNamed(RoutesName.homePageRecordsList + RoutesName.addRecord);
    if (result != null ){
      records.add(result);
    }
  }
}
