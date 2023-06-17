import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank/src/pages/add_record/view/widget/account_radio_group.dart';
import 'package:my_bank/src/pages/add_record/view/widget/costum_record_type_radio_group.dart';

import '../../../infrastructure/routes/route_name.dart';
import '../../../infrastructure/theme/my_theme.dart';
import '../controller/add_record_controller.dart';

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
          const CustomRecordTypeRadioGroup(),
          _formField(),
        ],
      ),
    );
  }

  Widget _formField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
      child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              _amountInputField(),
              const AccountRadioGroup(),
              _formSubmitButton(),
            ],
          )),
    );
  }

  Widget _formSubmitButton() => ElevatedButton(
      onPressed: () {
        _submitRecord();
      },
      style: _submitButtonStyle(),
      child: _submitButtonText()
  );

  Widget _submitButtonText() => const Padding(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
    child: Text(
      'submit',
      style: TextStyle(fontSize: 22),
    ),
  );

  ButtonStyle _submitButtonStyle() => ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return MainTheme.primaryColor;
          }
          return MainTheme.primaryColor; // Use the component's default.
        },
      ));

  void _submitRecord() {
    if (controller.formKey?.currentState?.validate() ?? false) {
      if (controller.recordIndex == null) {
        if(controller.addRecord() == null){
          Get.offAndToNamed(RoutesName.homePageRecordsList);
        }
      }
    }
  }

  Widget _amountInputField() => TextFormField(
    validator: (value) {
      if (controller.recordAmountController!.text.isNumericOnly) {
        return null;
      } else {
        return 'Only numeric characters';
      }
    },
    autovalidateMode: AutovalidateMode.onUserInteraction,
    maxLength: 20,
    keyboardType: TextInputType.number,
    controller: controller.recordAmountController,
    decoration: _amountInputFieldDecoration(),
    style: const TextStyle(color: Colors.black, fontSize: 16),
  );

  InputDecoration _amountInputFieldDecoration() {
    return InputDecoration(
      suffixIcon: InkWell(
        onTap: () {
          controller.recordAmountController?.text = '';
        },
        child: const Icon(
          Icons.cancel_outlined,
          color: MainTheme.secondaryColor,
        ),
      ),
      counterText: '',
      labelText: 'amount',
      labelStyle: TextStyle(
          color: MainTheme.primaryColor.withOpacity(0.9), fontSize: 18),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(color: MainTheme.primaryColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(
          color: MainTheme.primaryColor,
          width: 2.0,
        ),
      ),
      fillColor: MainTheme.primaryColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(color: MainTheme.primaryColor, width: 2),
      ),
    );
  }
}
