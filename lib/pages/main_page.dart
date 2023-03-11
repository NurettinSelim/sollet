import 'package:flutter/material.dart';
import 'package:sollet/tabs/explore_tab.dart';
import 'package:sollet/tabs/home_tab.dart';
import 'package:sollet/tabs/profile_tab.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  @override
  void initState() {
    // if (widget.firstConnection == true) {
    //   const snackBar = SnackBar(
    //     content: Text('Wallet connection successful'),
    //   );
    //   WidgetsBinding.instance.addPostFrameCallback(
    //       (_) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SolLet")),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.explore),
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPageIndex,
        children: const [
          HomeTab(),
          ExploreTab(),
          ProfileTab(),
        ],
      ),
    );
  }
}
