import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank/src/infrastructure/commons/data_bank.dart';
import '../../../../infrastructure/theme/my_theme.dart';
import '../../controller/add_record_controller.dart';



class AccountRadioGroup extends GetView<AddRecordController> {
  const AccountRadioGroup({super.key});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Radio(
                fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                  if (states.contains(MaterialState.selected)) {
                    return MainTheme.primaryColor;
                  }
                  return Colors.black;
                }),
                value: 0,
                groupValue: controller.accountChoiceGroupValue.value,
                onChanged: (value) {
                  controller.accountChoiceGroupValue.value = value ?? 1;
                }),
            Text(DataBank.bank.accounts[0].accountName),
          ],
        ),
        Row(
          children: [
            Radio(
                fillColor: MaterialStateProperty.resolveWith ((Set  states) {
                  if (states.contains(MaterialState.selected)) {
                    return MainTheme.primaryColor;
                  }
                  return Colors.black;
                }),
                value: 1,
                groupValue: controller.accountChoiceGroupValue.value,
                onChanged: (value) {
                  controller.accountChoiceGroupValue.value = value ?? 1;
                }),
            Text(DataBank.bank.accounts[1].accountName),
          ],
        )
      ],
    )),
  );
}
