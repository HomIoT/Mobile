import 'package:flutter/material.dart';
import 'package:homiot/app/screens/control/control.screen.dart';
import 'package:homiot/app/screens/status/status.screen.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  bool isAuth = true;

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    StatusScreen(),
    ControlScreen(),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.system_security_update),
            label: 'Status',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.control_point),
            label: 'Control',
          ),
        ],
        elevation: 10,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueGrey[900],
        unselectedItemColor: Colors.blueGrey[400],
        onTap: _onItemTapped,
      ),
    );
  }
}
