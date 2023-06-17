import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../infrastructure/commons/data_bank.dart';
import '../../shared/model/account.dart';
import '../../shared/model/enum_record_type.dart';
import '../../shared/model/expence_record.dart';
import '../../shared/model/income_record.dart';

class AddRecordController extends GetxController {
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

  // String? editRecord (){
  //   final PaymentRecord lastRecord = DataBank.bank.records[recordIndex!];
  //   final Account account = DataBank.bank.accounts[accountChoiceGroupValue.value];
  //   final double amount = double.parse(recordAmountController?.text ?? '0');
  //   switch(recordTypeGroup.value){
  //     case RecordTypeEnum.incomeRecord:
  //       if(lastRecord.runtimeType == IncomeRecord){
  //         return _editIncomeRecordToIncome(lastRecord, account, amount);
  //       }else {
  //         return _editExpenseRecordToIncome(lastRecord, account, amount);
  //       }
  //     case RecordTypeEnum.expenseRecord:
  //       if(lastRecord.runtimeType == IncomeRecord){
  //         if(lastRecord.relatedAccount == account){
  //           if((lastRecord.relatedAccount.balance - lastRecord.amount) > amount){
  //             lastRecord.relatedAccount.balance -= lastRecord.amount;
  //             DataBank.bank.records.removeAt(recordIndex!);
  //             DataBank.bank.records.insert(recordIndex!, ExpenseRecord(relatedAccount: account, amount: amount) as Record);
  //             account.balance -= amount;
  //             return null;
  //           }else {
  //             return 'Not enough money to edit this record';
  //           }
  //         }else{
  //           if(lastRecord.relatedAccount.balance > lastRecord.amount && account.balance > amount){
  //             lastRecord.relatedAccount.balance -= lastRecord.amount;
  //             DataBank.bank.records.removeAt(recordIndex!);
  //             DataBank.bank.records.insert(recordIndex!, ExpenseRecord(relatedAccount: account, amount: amount) as Record);
  //             account.balance -= amount;
  //             return null;
  //           }else {
  //             return 'Not enough money to edit this record';
  //           }
  //         }
  //       }else {
  //         if(lastRecord.relatedAccount == account){
  //           if((lastRecord.relatedAccount.balance + lastRecord.amount) > amount){
  //             lastRecord.relatedAccount.balance += lastRecord.amount;
  //             DataBank.bank.records.removeAt(recordIndex!);
  //             DataBank.bank.records.insert(recordIndex!, ExpenseRecord(relatedAccount: account, amount: amount) as Record);
  //             account.balance -= amount;
  //             return null;
  //           }else {
  //             return 'Not enough money to edit this record';
  //           }
  //         }else {
  //
  //         }
  //       }
  //       break;
  //   }
  //   return null;
  // }

  // String? _editExpenseRecordToIncome(PaymentRecord lastRecord, Account account, double amount) {
  //   lastRecord.relatedAccount.balance += lastRecord.amount;
  //   DataBank.bank.records.removeAt(recordIndex!);
  //   DataBank.bank.records.insert(recordIndex!, IncomeRecord(relatedAccount: account, amount: amount) as Record);
  //   account.balance += amount;
  //   return null;
  // }
  //
  // String? _editIncomeRecordToIncome(PaymentRecord lastRecord, Account account, double amount) {
  //   lastRecord.relatedAccount.balance -= lastRecord.amount;
  //   DataBank.bank.records.removeAt(recordIndex!);
  //   DataBank.bank.records.insert(recordIndex!, IncomeRecord(relatedAccount: account, amount: amount));
  //   account.balance += amount;
  //   return null;
  // }

  String? addRecord() {
    final Account account =
        DataBank.bank.accounts[accountChoiceGroupValue.value];
    final double amount = double.parse(recordAmountController?.text ?? '0');
    switch (recordTypeGroup.value) {
      case RecordTypeEnum.incomeRecord:
        return _addIncomeRecord(account, amount);
      case RecordTypeEnum.expenseRecord:
        return _addExpenseRecord(account, amount);
    }
  }

  String? _addExpenseRecord(Account account, double amount) {
    if (account.balanceAccount >= amount) {
      DataBank.bank.records.add(ExpenseRecord(
          relatedAccount: DataBank.bank.accounts[accountChoiceGroupValue.value],
          amount: double.parse(recordAmountController?.text ?? '0')) as Record);
      account.balanceAccount -= amount;
      return null;
    } else {
      return 'Not Enough Money';
    }
  }

  String? _addIncomeRecord(Account account, double amount) {
    DataBank.bank.records.add(IncomeRecord(
        relatedAccount: account,
        amount: double.parse(recordAmountController?.text ?? '0')) as Record);
    account.balanceAccount += amount;
    return null;
  }
}
