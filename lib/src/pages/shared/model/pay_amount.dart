import 'account.dart';

class PaymentRecord {
  final Account relatedAccount;
  final double amount;

  const PaymentRecord({required this.amount, required this.relatedAccount});
}
