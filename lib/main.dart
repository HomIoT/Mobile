import 'package:flutter/material.dart';
import 'package:homiot/app/screens/landing.dart';
import 'package:homiot/app/services/state/state.service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'HomIoT',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
        ),
        home: const Landing(),
      ),
    );
  }
}
