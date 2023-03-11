import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text(
            "Currently you have 0 Newsletter \nYou can add newsletter via Explore tab :)",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
