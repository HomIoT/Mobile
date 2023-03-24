import 'package:flutter/material.dart';
import 'package:homiot/app/screens/auth/auth.screen.dart';
import 'package:homiot/app/screens/home/home.screen.dart';
import 'package:homiot/app/services/state/state.service.dart';
import 'package:provider/provider.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    bool authenticated =
        Provider.of<AppState>(context, listen: true).getAuthenticated;

    return authenticated ? const HomeScreen() : const AuthScreen();
  }
}
