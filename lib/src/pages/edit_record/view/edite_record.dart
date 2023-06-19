import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_bank/src/pages/edit_record/view/widget/account_radio_group.dart';
import 'package:my_bank/src/pages/edit_record/view/widget/costum_record_type_radio_group.dart';
import '../../../infrastructure/theme/my_theme.dart';
import '../controller/edite_record_controller.dart';

class EditRecord extends GetView<EditRecordController> {
  const EditRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('edit record'),
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

  Widget _formSubmitButton() =>
      ElevatedButton(
          onPressed: () {
            controller.submitRecord();
          },
          style: _submitButtonStyle(),
          child: _submitButtonText()
      );

  Widget _submitButtonText() =>
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 14),
        child: Text(
          'submit',
          style: TextStyle(fontSize: 22),
        ),
      );

  ButtonStyle _submitButtonStyle() =>
      ButtonStyle(
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
}