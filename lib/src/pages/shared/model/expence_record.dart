import 'package:my_bank/src/pages/shared/model/account.dart';
import 'package:my_bank/src/pages/shared/model/record.dart';

class ExpenseRecord extends Record {
  const ExpenseRecord({required double amount, required Account relatedAccount})
      : super(amount: amount, relatedAccount: relatedAccount);

}
