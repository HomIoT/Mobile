import 'package:flutter/material.dart';
import 'package:homiot/app/services/api/api.service.dart';
import 'package:homiot/app/services/state/state.service.dart';
import 'package:provider/provider.dart';

class SystemWidget extends StatefulWidget {
  const SystemWidget({super.key, this.system});

  final dynamic system;

  @override
  State<SystemWidget> createState() => _SystemWidgetState();
}

class _SystemWidgetState extends State<SystemWidget> {
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

  Future<void> updateSystem() async {
    String id = widget.system["_id"];
    dynamic data = {
      "state": !widget.system["state"],
    };

    var response = _client.update(id, data, context);

    response.then((result) {
      _showSnackBar(context, "System updated");

      getSystems();
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.system["name"]),
            Switch(
              value: widget.system["state"],
              onChanged: (bool value) => updateSystem(),
            ),
          ],
        ),
        Text("Digital: ${widget.system["digital"].toString()}"),
      ],
    );
  }
}
