import 'account.dart';

abstract class Record{
  final double amount;
  final Account relatedAccount;

  const Record({required this.amount,required this.relatedAccount});
}