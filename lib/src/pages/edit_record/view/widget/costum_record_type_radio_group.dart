import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../shared/model/enum_record_type.dart';

import '../../controller/edite_record_controller.dart';
import 'custom_radio_button.dart';


class CustomRecordTypeRadioGroup extends GetView<EditRecordController> {
  const CustomRecordTypeRadioGroup({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _incomeButton(),
        _expenseButton(),
      ],
    ),
  );

  Obx _expenseButton() => Obx(() => Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomRadioButton(
          label: 'Expense',
          recordType: RecordTypeEnum.expenseRecord,
          groupTypeValue: controller.recordTypeGroup.value,
          onChoice: (value) {
            controller.recordTypeGroup.value = value;
          }),
    ),
  ));

  Obx _incomeButton() => Obx(() => Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomRadioButton(
          label: 'Income',
          recordType: RecordTypeEnum.incomeRecord,
          groupTypeValue: controller.recordTypeGroup.value,
          onChoice: (value) {
            controller.recordTypeGroup.value = value;
          }),
    ),
  ));
}
