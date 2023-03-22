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

  Future<void> getSystems() async {
    var response = _client.all();

    response.then((result) {
      Provider.of<AppState>(context, listen: false).setSystems(result.data);
    }).catchError((error) {});
  }

  Future<void> updateSystem() async {
    String id = widget.system["_id"];
    dynamic data = {
      "active": !widget.system["active"],
    };

    var response = _client.update(id, data);

    response.then((result) {
      getSystems();
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Row(
        //   children: [
        //     IconButton(
        //         onPressed: () {},
        //         icon: const Icon(
        //           Icons.delete,
        //           color: Colors.red,
        //         )),
        //     const SizedBox(
        //       width: 10,
        //     ),
        //     Text(widget.system["name"]),
        //   ],
        // ),
        Text(widget.system["name"]),

        Switch(
          value: widget.system["active"],
          onChanged: (bool value) => updateSystem(),
        ),
      ],
    );
  }
}
