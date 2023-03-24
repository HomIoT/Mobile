import 'package:flutter/material.dart';
import 'package:homiot/app/services/api/api.service.dart';
import 'package:homiot/app/services/state/state.service.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final DioClient _client = DioClient();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> _showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> login() async {
    dynamic data = {
      "username": _username.text,
      "password": _password.text,
    };

    var response = _client.login(data);

    response.then((result) {
      if (result.statusCode == 200) {
        Provider.of<AppState>(context, listen: false).setAuthenticated(true);
        Provider.of<AppState>(context, listen: false)
            .setToken(result.data["token"]);

        _username.clear();
        _password.clear();
      } else {
        _showSnackBar(context, result.data["message"].toString());
      }
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signin"),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                "Signin",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.blueGrey,
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _username,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Username"),
                hintText: "Enter you username",
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _password,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Password"),
                hintText: "Enter you password",
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(elevation: 0),
                child: const Text("Login"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
