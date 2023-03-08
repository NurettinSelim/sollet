import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'package:sollet/core/logic/wallet_adapter.dart';
import 'package:sollet/models/wallet.dart';
import 'package:sollet/models/wallet_provider.dart';

class WalletConnectPage extends StatelessWidget {
  const WalletConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            TextButton(
              onPressed: () async {
                try {
                  AuthorizeResult result = await WalletAdapter().authorize();
                  if (context.mounted) {
                    Provider.of<WalletModel>(context, listen: false)
                        .set(Wallet.fromAuthResult(result));
                  }
                } catch (e) {
                  //TODO catch error
                }
              },
              child: const Text('Authorize'),
            ),
            TextButton(
              onPressed: () async {
                try {
                  await WalletAdapter().deauthorize();

                  if (context.mounted) {
                    Provider.of<WalletModel>(context, listen: false).clear();
                  }
                } catch (e) {
                  //TODO catch error
                }
              },
              child: const Text('Deauthorize'),
            ),
          ],
        ),
        Consumer<WalletModel>(
          builder: (context, value, child) {
            return Text(
                value.wallet?.accounts[0].toJsonClean().toString() ?? "");
          },
        )
      ],
    );
  }
}
