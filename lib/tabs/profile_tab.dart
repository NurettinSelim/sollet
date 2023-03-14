import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'package:sollet/core/logic/wallet_adapter.dart';
import 'package:sollet/core/router.dart';
import 'package:sollet/models/newsletter.dart';
import 'package:sollet/models/newsletter_model.dart';
import 'package:sollet/models/wallet_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.onSecondary,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  const CircleAvatar(radius: 48),
                  const SizedBox(width: 24),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final List<Account> accounts =
                                  Provider.of<WalletModel>(context)
                                      .wallet!
                                      .accounts;
                              return AlertDialog(
                                content: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.5,
                                    width: double.maxFinite,
                                    child: ListView.separated(
                                        itemBuilder: (context, index) => Text(
                                            accounts[index]
                                                .toJson()
                                                .toString()),
                                        separatorBuilder: (context, index) =>
                                            const Divider(),
                                        itemCount: accounts.length),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          Provider.of<WalletModel>(context)
                                  .wallet
                                  ?.accounts[0]
                                  .label
                                  .toString() ??
                              "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          try {
                            await WalletAdapter().deauthorize();
                            if (context.mounted) {
                              Provider.of<WalletModel>(context, listen: false)
                                  .clear();
                              context.goNamed(Routes.connect.name);
                            }
                          } catch (e) {
                            debugPrint(e.toString());
                          }
                        },
                        child: const Text("Disconnect Wallet"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.onSecondary,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Newsletters",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Consumer<NewsletterProvider>(
                      builder: (context, value, child) {
                        final List<Newsletter> newsletters =
                            value.selectedNewsletters;
                        return ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                newsletters[index].topic,
                                style: const TextStyle(fontSize: 18),
                              ),
                              subtitle: Text(
                                newsletters[index].desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.cancel_outlined),
                                tooltip: "Unsubscribe",
                                onPressed: () {
                                  value.deleteNewsletter(newsletters[index]);
                                },
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: newsletters.length,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
