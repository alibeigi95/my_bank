import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank/src/pages/shared/model/pay_amount.dart';


import '../../../../infrastructure/theme/my_theme.dart';
import '../../../shared/model/expence_record.dart';
import '../../controller/home_page_record_list_controller.dart';

class RecordItem extends GetView<HomePageRecordListController> {
  const RecordItem({super.key, required this.paymentRecord,required this.index,});

  final PaymentRecord paymentRecord;
  final int index;

  @override
  Widget build(BuildContext context) {
    final String recordType =
        (paymentRecord is ExpenseRecord) ? 'EXPENSE' : 'INCOME';
    final Color recordTypeColor = (paymentRecord is ExpenseRecord)
        ? const Color(0xffC40024)
        : const Color(0xff3B611C);
    final String recordTypeSign = (paymentRecord is ExpenseRecord) ? '-' : '+';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          controller.goToEditPage(index);
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                )
              ],
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).scaffoldBackgroundColor),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _recordAccountNameText(),
                    // _editRecordButton(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _recordAmountText(recordTypeSign, recordTypeColor),
                    _recordTypeBadge(recordTypeColor, recordType),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _recordTypeBadge(Color recordTypeColor, String recordType) =>
      DecoratedBox(
        decoration: BoxDecoration(
            color: recordTypeColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: recordTypeColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
          child: Text(
            recordType,
            style: TextStyle(color: recordTypeColor),
          ),
        ),
      );

  Widget _recordAccountNameText() {
    return Text(
      paymentRecord.relatedAccount.accountName,
      style: const TextStyle(
          color: MainTheme.primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal),
    );
  }

  Widget _recordAmountText(String recordTypeSign, Color recordTypeColor) =>
      Text(
        '$recordTypeSign ${paymentRecord.amount}',
        style: TextStyle(
            color: recordTypeColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal),
      );

//
// Widget _editRecordButton() => Material(
//   color: MainTheme.primaryColor.withOpacity(0.1),
//   borderRadius: BorderRadius.circular(6),
//   child: InkWell(
//     borderRadius: BorderRadius.circular(6),
//     onTap: (){
//       // Get.offAndToNamed(
//       //     RoutesName.piggyBank + RoutesName.record,
//       //     arguments: {'index':recordIndex}
//       // );
//     },
//     child: const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 18,vertical: 2),
//       child: Icon(
//         Icons.edit_note,
//         color: MainTheme.primaryColor,
//         size: 24,
//       ),
//     ),
//   ),
// );
}
