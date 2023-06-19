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
              _inputAmount(),
              const AccountRadioGroup(),
              _formSubmitButton(),
            ],
          )),
    );
  }

  Widget _formSubmitButton() => ElevatedButton(
      onPressed: () {
        controller.submitRecord();
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



  Widget _inputAmount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: const Color(0xff88d79f),
              borderRadius: BorderRadius.circular(40)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
              controller: controller.recordAmountController,
              decoration: const InputDecoration(
                icon: Icon(Icons.attach_money, color: Colors.white),
                border: InputBorder.none,
                label: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Text(
                    'amount',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              validator: (value) {
                if (controller.recordAmountController!.text.isNumericOnly) {
                  return null;
                } else {
                  return 'Only numeric characters';
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  // Widget _amountInputField() => TextFormField(
  //   validator: (value) {
  //     if (controller.recordAmountController!.text.isNumericOnly) {
  //       return null;
  //     } else {
  //       return 'Only numeric characters';
  //     }
  //   },
  //   autovalidateMode: AutovalidateMode.onUserInteraction,
  //   maxLength: 20,
  //   keyboardType: TextInputType.number,
  //   controller: controller.recordAmountController,
  //   decoration: _amountInputFieldDecoration(),
  //   style: const TextStyle(color: Colors.black, fontSize: 16),
  // );
  //
  // InputDecoration _amountInputFieldDecoration() {
  //   return InputDecoration(
  //     counterText: '',
  //     labelText: 'amount',
  //     labelStyle: TextStyle(
  //         color: MainTheme.primaryColor.withOpacity(0.9), fontSize: 18),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6.0),
  //       borderSide: const BorderSide(color: MainTheme.primaryColor, width: 2),
  //     ),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6.0),
  //       borderSide: const BorderSide(
  //         color: MainTheme.primaryColor,
  //         width: 2.0,
  //       ),
  //     ),
  //     fillColor: MainTheme.primaryColor,
  //     border: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(6.0),
  //       borderSide: const BorderSide(color: MainTheme.primaryColor, width: 2),
  //     ),
  //   );
  // }
}
