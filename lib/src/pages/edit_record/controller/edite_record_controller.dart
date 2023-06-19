import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_bank/src/pages/shared/model/pay_amount.dart';

import '../../../infrastructure/commons/data_bank.dart';

import '../../shared/model/account.dart';
import '../../shared/model/enum_record_type.dart';
import '../../shared/model/expence_record.dart';
import '../../shared/model/income_record.dart';

class EditRecordController extends GetxController {
  int? recordIndex;
  Rx<RecordTypeEnum> recordTypeGroup = RecordTypeEnum.incomeRecord.obs;
  GlobalKey<FormState>? formKey;
  TextEditingController? recordAmountController;
  RxInt accountChoiceGroupValue = 0.obs;

  @override
  void onInit() {
    recordIndex = Get.arguments?['index'];
    formKey = GlobalKey();
    recordAmountController = TextEditingController();
    super.onInit();
  }

  void submitRecord() {
    if (formKey?.currentState?.validate() ?? false) {
      if (recordIndex == null) {
        addRecord();

      }
    }
  }

  void  addRecord() {
    final Account account =
    DataBank.bank.accounts[accountChoiceGroupValue.value];
    final double amount = double.parse(recordAmountController?.text ?? '0');
    PaymentRecord? paymentRecord;
    switch (recordTypeGroup.value) {
      case RecordTypeEnum.incomeRecord:
        paymentRecord =  _addIncomeRecord(account, amount);
      case RecordTypeEnum.expenseRecord:
        paymentRecord = _addExpenseRecord(account, amount);
    }
    Get.back(result: paymentRecord);
  }

  PaymentRecord? _addExpenseRecord(Account account, double amount) {
    if (account.balanceAccount >= amount) {
      ExpenseRecord expenseRecord = ExpenseRecord(
          account: DataBank.bank.accounts[accountChoiceGroupValue.value],
          amount: double.parse(recordAmountController?.text ?? '0'));
      DataBank.bank.records.add(expenseRecord);
      account.balanceAccount -= amount;
      return expenseRecord;
    } else {
      return null;
    }
  }

  PaymentRecord _addIncomeRecord(Account account, double amount) {
    IncomeRecord incomeRecord = IncomeRecord(
        account: DataBank.bank.accounts[accountChoiceGroupValue.value],
        amount: double.parse(recordAmountController?.text ?? '0'));
    DataBank.bank.records.add(incomeRecord);
    account.balanceAccount += amount;
    return incomeRecord;
  }
}
