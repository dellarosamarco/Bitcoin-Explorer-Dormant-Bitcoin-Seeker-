import 'package:dormant_bitcoin_seeker_flutter/Shared/bitcoin_wallet_card.dart';
import 'package:flutter/material.dart';

class RandomWalletGenerator extends StatefulWidget {
  const RandomWalletGenerator({Key? key, required this.wallets})
      : super(key: key);

  final List<BitcoinWalletCard> wallets;

  @override
  _RandomWalletGeneratorState createState() => _RandomWalletGeneratorState();
}

class _RandomWalletGeneratorState extends State<RandomWalletGenerator> {
  @override
  Widget build(BuildContext context) {
    return widget.wallets.isNotEmpty
        ? SizedBox(
            width: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: widget.wallets,
                  )
                ]),
          )
        : Column(children: const [
            Center(
              child: Text("EMPTY", style: TextStyle(color: Colors.white)),
            ),
          ]);
  }
}
