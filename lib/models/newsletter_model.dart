import 'package:flutter/material.dart';
import 'package:sollet/models/newsletter.dart';

class NewsletterProvider extends ChangeNotifier {
  List<Newsletter> selectedNewsletters = [];
  bool addNewsletter(Newsletter newsletter) {
    if (selectedNewsletters
        .any((element) => element.shortName == newsletter.shortName)) {
      return false;
    } else {
      selectedNewsletters.add(newsletter);
    }
    notifyListeners();
    return true;
  }

  bool deleteNewsletter(Newsletter newsletter) {
    if (!selectedNewsletters
        .any((element) => element.shortName == newsletter.shortName)) {
      return false;
    } else {
      selectedNewsletters
          .removeWhere((element) => element.shortName == newsletter.shortName);
    }
    notifyListeners();
    return true;
  }
}
