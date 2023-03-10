import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'package:sollet/core/utils/app_config.dart';
import 'package:solana_common/config/cluster.dart';

// Singleton version of [SolanaWalletAdapter]
class WalletAdapter extends SolanaWalletAdapter {
  static final WalletAdapter _instance = WalletAdapter._internal(
    AppIdentity(
      uri: Uri.tryParse(AppConfig.appUrl),
      name: AppConfig.appName,
      // icon: Uri.tryParse(AppConfig.iconUrl),
    ),
    cluster: Cluster.devnet,
  );

  factory WalletAdapter() => _instance;
  // ignore: unused_element
  WalletAdapter._internal(super.identity, {super.cluster, super.hostAuthority});
}
