import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sollet/core/router.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      context.goNamed(Routes.home.name);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SizedBox(width: double.infinity),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text(
                  "Wallet connection successful 🎉",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.apply(color: Colors.lightGreen),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Newsletters are loading"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
