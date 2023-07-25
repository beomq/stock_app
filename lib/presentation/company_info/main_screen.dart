import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('aa'),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.ice_skating), label: 'aa'),
          NavigationDestination(icon: Icon(Icons.ice_skating), label: 'aa'),
          NavigationDestination(icon: Icon(Icons.ice_skating), label: 'aa'),
        ],
      ),
    );
  }
}
