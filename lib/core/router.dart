import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sollet/models/wallet_provider.dart';
import 'package:sollet/pages/main_page.dart';
import 'package:sollet/pages/error_page.dart';
import 'package:sollet/pages/wallet_connect_page.dart';

enum Routes {
  connect,
  home,
}

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.connect.name,
      path: "/connect",
      builder: (context, state) => const WalletConnectPage(),
    ),
    GoRoute(
      name: Routes.home.name,
      path: "/",
      builder: (context, state) {
        debugPrint(state.queryParams.toString());
        final firstConnection = state.queryParams['firstConnection'] == "true";
        return MainPage(firstConnection: firstConnection);
      },
      redirect: (context, state) {
        if (Provider.of<WalletModel>(context, listen: false).wallet == null) {
          return "/connect";
        }
        return null;
      },
    ),
    // GoRoute(
    //   path: "/dynamic/:dynamic",
    //   name: Routes.paths.name,
    //   builder: (context, state) => Page(state.params["dynamic"]!),
    // ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
