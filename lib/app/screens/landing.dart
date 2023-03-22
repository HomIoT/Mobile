import 'package:flutter/material.dart';
import 'package:homiot/app/screens/new/new.screen.dart';
import 'package:homiot/app/screens/systems/systems.screen.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool isAuth = true;

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    SystemScreen(),
    NewScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomIoT"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Systems',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_label),
            label: 'New System',
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.grey[100],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey[800],
        unselectedItemColor: Colors.blueGrey[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
