import 'package:flutter/material.dart';
import 'package:homiot/app/screens/home/tabs/new/new.screen.dart';
import 'package:homiot/app/screens/home/tabs/systems/systems.screen.dart';
import 'package:homiot/app/services/api/api.service.dart';
import 'package:homiot/app/services/state/state.service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DioClient _client = DioClient();

  Future<void> _showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> getSystems() async {
    var response = _client.all(context);

    response.then((result) {
      Provider.of<AppState>(context, listen: false).setSystems(result.data);
    }).catchError((error) {});
  }

  Future<void> restartSystems() async {
    var response = _client.reset(context);

    response.then((result) {
      _showSnackBar(context, "Systems restarted");
      getSystems();
    }).catchError((error) {});
  }

  void logout() {
    Provider.of<AppState>(context, listen: false).logout();
  }

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
        leading: IconButton(
          onPressed: restartSystems,
          icon: const Icon(Icons.restart_alt),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
