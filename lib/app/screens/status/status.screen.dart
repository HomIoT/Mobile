import 'package:flutter/material.dart';
import 'package:homiot/app/services/api/api.service.dart';
import 'package:homiot/app/widgets/system/system.widget.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List systems = [
    {
      "id": 1,
      "name": "Room light",
      "status": true,
    },
    {
      "id": 2,
      "name": "Kitchen light",
      "status": false,
    },
    {
      "id": 3,
      "name": "Bathroom light",
      "status": true,
    },
    {
      "id": 4,
      "name": "Locker light",
      "status": false,
    }
  ];

  final DioClient _client = DioClient();

  Future<void> getSystems(BuildContext context) async {
    var response = _client.all();

    response.then((result) {
      if (result.statusCode == 200) {
        print(response);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: systems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: SystemWidget(system: systems[index]),
          );
        },
      ),
    );
  }
}
