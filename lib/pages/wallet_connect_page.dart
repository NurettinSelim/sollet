import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'package:sollet/core/logic/wallet_adapter.dart';
import 'package:sollet/core/router.dart';
import 'package:sollet/models/wallet.dart';
import 'package:sollet/models/wallet_provider.dart';

class WalletConnectPage extends StatelessWidget {
  const WalletConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(width: double.infinity),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Text(
                  "Get Started!",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ],
          ),
          Center(
            child: FilledButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              onPressed: () async {
                try {
                  AuthorizeResult result = await WalletAdapter().authorize();
                  if (context.mounted) {
                    Provider.of<WalletModel>(context, listen: false)
                        .set(Wallet.fromAuthResult(result));
                    context.goNamed(
                      Routes.home.name,
                      queryParams: {"firstConnection": "true"},
                    );
                  }
                } catch (e) {
                  debugPrint(e.toString());
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Connect your wallet",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}


// Consumer<WalletModel>(
//             builder: (context, value, child) {
//               return Text(
//                   value.wallet?.accounts[0].toJsonClean().toString() ?? "");
//             },
//           )