import 'package:flutter/material.dart';
import 'package:my_bank/src/pages/shared/model/account.dart';
import 'package:my_bank/src/pages/shared/model/manager_app.dart';

class DataBank{

  static ManagerApp bank =  ManagerApp(records: [], accounts: [
    Account(accountName: 'bitcoin wallet',balanceAccount: 10000,cardColor: Colors.lightGreen),
    Account(accountName: 'polka-dot wallet',balanceAccount: 20000,cardColor: Colors.blueGrey),

  ]);


}