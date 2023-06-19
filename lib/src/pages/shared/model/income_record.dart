import 'package:my_bank/src/pages/shared/model/account.dart';
import 'package:my_bank/src/pages/shared/model/pay_amount.dart';


class IncomeRecord extends PaymentRecord {
  const IncomeRecord({required double amount, required Account account})
      : super(amount: amount,relatedAccount: account);

  @override
  String toString() {
    return '+ $amount';
  }
}
