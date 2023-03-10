import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final bool? firstConnection;
  const MainPage({super.key, this.firstConnection});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  @override
  void initState() {
    if (widget.firstConnection == true) {
      const snackBar = SnackBar(
        content: Text('Wallet connection successful'),
      );
      WidgetsBinding.instance.addPostFrameCallback(
          (_) => ScaffoldMessenger.of(context).showSnackBar(snackBar));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.firstConnection.toString());
    return Scaffold(
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
        children: [
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text('Home Page'),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text('Explore Page'),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Profile Page'),
          ),
        ],
      ),
    );
  }
}
