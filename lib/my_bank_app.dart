import 'package:flutter/material.dart';
import 'package:my_bank/src/infrastructure/routes/route_page.dart';
import 'src/infrastructure/routes/route_name.dart';
import 'package:get/get.dart';

class MyBankApp extends StatelessWidget {
  const MyBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'my bank',
        initialRoute: RoutesName.loginPage,
        getPages: RoutePages.pages,
      );
}
