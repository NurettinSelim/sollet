import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';

class Wallet {
  final List<Account> accounts;
  final String authToken;
  final Uri? walletUriBase;

  factory Wallet.fromAuthResult(AuthorizeResult authResult) {
    return Wallet(
      authResult.accounts,
      authResult.authToken,
      authResult.walletUriBase,
    );
  }

  Wallet(
    this.accounts,
    this.authToken,
    this.walletUriBase,
  );
}
