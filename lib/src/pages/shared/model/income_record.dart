import 'package:my_bank/src/pages/shared/model/account.dart';
import 'package:my_bank/src/pages/shared/model/record.dart';

class IncomeRecord extends Record {
  const IncomeRecord({required double amount, required Account relatedAccount})
      : super(amount: amount, relatedAccount: relatedAccount);
}
