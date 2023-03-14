import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sollet/core/router.dart';
import 'package:sollet/core/utils/theme_helper.dart';
import 'package:sollet/models/newsletter_model.dart';
import 'package:sollet/models/wallet_provider.dart';

void main() {
  // SolanaWalletAdapter(const AppIdentity());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WalletModel()),
        ChangeNotifierProvider(create: (context) => NewsletterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SolLet',
      theme: ThemeHelper.themeData,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
