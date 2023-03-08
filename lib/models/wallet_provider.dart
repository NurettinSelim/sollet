import 'package:flutter/material.dart';
import 'package:sollet/models/wallet.dart';

class WalletModel extends ChangeNotifier {
  Wallet? wallet;
  void set(Wallet wal) {
    wallet = wal;
    notifyListeners();
  }

  void clear() {
    wallet = null;
    notifyListeners();
  }
}
