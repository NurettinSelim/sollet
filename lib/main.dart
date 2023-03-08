import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sollet/models/wallet_provider.dart';
import 'package:sollet/pages/wallet_connect_page.dart';

void main() {
  // SolanaWalletAdapter(const AppIdentity());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WalletModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: WalletConnectPage(),
      ),
    );
  }
}
