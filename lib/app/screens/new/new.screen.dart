import 'package:flutter/material.dart';
import 'package:homiot/app/services/api/api.service.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final DioClient _client = DioClient();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _digital = TextEditingController();

  Future<void> _showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> createSystem() async {
    dynamic data = {
      "name": _name.text,
      "digital": _digital.text,
    };

    var response = _client.create(data);

    response.then((result) {
      _showSnackBar(context, "System created");

      _name.clear();
      _digital.clear();
    }).catchError((error) {
      // _showSnackBar(context, error.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _name,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("System name"),
            hintText: "Enter you new system name",
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _digital,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Connected digital"),
            hintText: "Enter you system digital",
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: createSystem,
            style: ElevatedButton.styleFrom(elevation: 0),
            child: const Text("Add system"),
          ),
        ),
      ],
    );
  }
}
