import 'package:flutter/material.dart';
import 'package:my_bank/src/pages/shared/model/account.dart';

class CardAccount extends StatelessWidget {
  final Account account;

  const CardAccount({Key? key, required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: DecoratedBox(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: account.cardColor),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            child: Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: Icon(Icons.account_balance,
                            color: Colors.white, size: 26),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3),
                        child: Icon(Icons.account_balance_wallet,
                            color: Colors.white, size: 26),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(account.accountName,
                          style: const TextStyle(color: Colors.white, fontSize: 25)),
                      Text('${account.balanceAccount.toString()} IRT ',
                          style: const TextStyle(color: Colors.white,fontSize: 26))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
  );
}
