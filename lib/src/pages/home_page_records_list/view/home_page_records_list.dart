import 'package:flutter/material.dart';
import 'package:my_bank/src/infrastructure/routes/route_name.dart';
import 'package:my_bank/src/pages/home_page_records_list/controller/home_page_record_list_controller.dart';
import 'package:my_bank/src/pages/home_page_records_list/view/widget/card_account.dart';
import 'package:my_bank/src/pages/home_page_records_list/view/widget/labeled_divider.dart';
import 'package:get/get.dart';
import 'package:my_bank/src/pages/home_page_records_list/view/widget/record_item.dart';

class HomePageRecordsList extends GetView<HomePageRecordListController> {
  const HomePageRecordsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.green[100],
        appBar: AppBar(
            title: const Text('Main Page My Bank'),
            backgroundColor: Colors.green[300]),
        body: Column(
          children: [
            _listViewAccount(),
            const LabeledDivider(
              label: 'Record',
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.records.length,
                    itemBuilder: (context, index) =>
                        RecordItem(paymentRecord:  controller.records[index] )),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.goToAddPage();
          },
          backgroundColor: Colors.green[300],
          child: const Icon(Icons.add, size: 35),
        ),
      );

  Widget _listViewAccount() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() =>  ListView.builder(
            shrinkWrap: true,
            itemCount: controller.accounts.length,
            itemBuilder: (context, index) =>
                CardAccount(account: controller.accounts[index]),
          ),
        ),
      );
}
