import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/add_record_controller.dart';

class AddRecord extends GetView<AddRecordController> {
  const AddRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('add record'),
        backgroundColor: Colors.green[300],
      ),
      backgroundColor: Colors.green[100],
      body: Column(
        children: [
          Obx(() => RadioListTile<int>(
                title: Text('Option 1'),
                value: 1,
                groupValue: controller.selectedValue.value,
                onChanged: (value) => controller.setSelectedValue(value!),
              )),
          Obx(() => RadioListTile<int>(
            title: Text('Option 1'),
            value: 2,
            groupValue: controller.selectedValue.value,
            onChanged: (value) => controller.setSelectedValue(value!),
          )),
        ],
      ),
    );
  }
}
