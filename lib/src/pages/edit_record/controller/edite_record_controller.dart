import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:my_bank/src/pages/shared/model/pay_amount.dart';
import '../../../infrastructure/commons/data_bank.dart';
import '../../shared/model/account.dart';
import '../../shared/model/enum_record_type.dart';
import '../../shared/model/expence_record.dart';
import '../../shared/model/income_record.dart';

class EditRecordController extends GetxController {
  int recordIndex = Get.arguments;
  Rx<RecordTypeEnum> recordTypeGroup = RecordTypeEnum.incomeRecord.obs;
  GlobalKey<FormState>? formKey;
  TextEditingController recordAmountController = TextEditingController();
  RxInt accountChoiceGroupValue = 0.obs;

  @override
  void onInit() {
    formKey = GlobalKey();
    final PaymentRecord record = DataBank.bank.records[recordIndex];
    recordAmountController.text = '${record.amount}';
    if (record is ExpenseRecord) {
      recordTypeGroup.value = RecordTypeEnum.expenseRecord;
    } else if (record is IncomeRecord) {
      recordTypeGroup.value = RecordTypeEnum.incomeRecord;
    }
    if (record.relatedAccount.accountName ==
        DataBank.bank.accounts[0].accountName) {
      accountChoiceGroupValue.value = 0;
    } else if (record.relatedAccount.accountName ==
        DataBank.bank.accounts[1].accountName) {
      accountChoiceGroupValue.value = 1;
    }
    super.onInit();
  }

  void submitRecord() {
    if (formKey?.currentState?.validate() ?? false) {
      editRecord();
    }
  }

  void editRecord() {
    final Account account =
        DataBank.bank.accounts[accountChoiceGroupValue.value];
    final double amount = double.parse(recordAmountController.text );
    PaymentRecord editPaymentRecord = DataBank.bank.records[recordIndex];
    PaymentRecord? editPaymentRecords;
    switch (recordTypeGroup.value) {
      case RecordTypeEnum.incomeRecord:
        if (editPaymentRecord.runtimeType == IncomeRecord) {
          editPaymentRecords =
              _editIncomeRecordToIncome(editPaymentRecord, account, amount);
        } else {
          editPaymentRecords =
              _editExpenseRecordToIncom(editPaymentRecord, account, amount);
        }
      case RecordTypeEnum.expenseRecord:
        if (editPaymentRecord.runtimeType == IncomeRecord) {
          if (editPaymentRecord.relatedAccount == account) {
            if ((editPaymentRecord.relatedAccount.balanceAccount -
                    editPaymentRecord.amount) >
                amount) {
              editPaymentRecord.relatedAccount.balanceAccount -=
                  editPaymentRecord.amount;
              DataBank.bank.records.removeAt(recordIndex);
              ExpenseRecord expenseRecord = ExpenseRecord(
                  account:
                      DataBank.bank.accounts[accountChoiceGroupValue.value],
                  amount: double.parse(recordAmountController.text));
              DataBank.bank.records.insert(recordIndex, expenseRecord);
              account.balanceAccount -= amount;
              editPaymentRecords = expenseRecord;
            } else {
              // return 'Not enough money to edit this record';
            }
          } else {
            if (editPaymentRecord.relatedAccount.balanceAccount >
                    editPaymentRecord.amount &&
                account.balanceAccount > amount) {
              editPaymentRecord.relatedAccount.balanceAccount -=
                  editPaymentRecord.amount;
              DataBank.bank.records.removeAt(recordIndex);
              ExpenseRecord expenseRecord = ExpenseRecord(
                  account:
                      DataBank.bank.accounts[accountChoiceGroupValue.value],
                  amount: double.parse(recordAmountController.text));
              DataBank.bank.records.insert(recordIndex, expenseRecord);
              account.balanceAccount -= amount;
              editPaymentRecords = expenseRecord;
            } else {
              //return 'Not enough money to edit this record';
            }
          }
        } else {
          if (editPaymentRecord.relatedAccount == account) {
            if ((editPaymentRecord.relatedAccount.balanceAccount +
                    editPaymentRecord.amount) >
                amount) {
              editPaymentRecord.relatedAccount.balanceAccount +=
                  editPaymentRecord.amount;
              DataBank.bank.records.removeAt(recordIndex);
              ExpenseRecord expenseRecord = ExpenseRecord(
                  account:
                      DataBank.bank.accounts[accountChoiceGroupValue.value],
                  amount: double.parse(recordAmountController.text ));
              DataBank.bank.records.insert(recordIndex, expenseRecord);
              account.balanceAccount -= amount;
              editPaymentRecords = expenseRecord;
            } else {
              // return 'Not enough money to edit this record';
            }
          }
        }
    }
    Get.back(result: editPaymentRecords);
  }

  PaymentRecord _editExpenseRecordToIncom(
      PaymentRecord editPaymentRecord, Account account, double amount) {
    editPaymentRecord.relatedAccount.balanceAccount += editPaymentRecord.amount;
    DataBank.bank.records.removeAt(recordIndex);
    IncomeRecord incomeRecord = IncomeRecord(
        account: DataBank.bank.accounts[accountChoiceGroupValue.value],
        amount: double.parse(recordAmountController.text));
    DataBank.bank.records.insert(recordIndex, incomeRecord);
    account.balanceAccount += amount;
    return incomeRecord;
  }

  PaymentRecord _editIncomeRecordToIncome(
      PaymentRecord editPaymentRecord, Account account, double amount) {
    editPaymentRecord.relatedAccount.balanceAccount -= editPaymentRecord.amount;
    DataBank.bank.records.removeAt(recordIndex);
    IncomeRecord incomeRecord = IncomeRecord(
        account: DataBank.bank.accounts[accountChoiceGroupValue.value],
        amount: double.parse(recordAmountController.text));
    DataBank.bank.records.insert(recordIndex, incomeRecord);
    account.balanceAccount += amount;
    return incomeRecord;
  }
}
