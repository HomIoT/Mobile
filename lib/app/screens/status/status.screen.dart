import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: systems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(systems[index]["name"]),
                Switch(
                  value: systems[index]["status"],
                  onChanged: (bool value) {
                    systems[index]["status"] = value;
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
