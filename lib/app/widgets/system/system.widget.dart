import 'package:flutter/material.dart';

class SystemWidget extends StatefulWidget {
  const SystemWidget({super.key, this.system});

  final system;

  @override
  State<SystemWidget> createState() => _SystemWidgetState();
}

class _SystemWidgetState extends State<SystemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.system["name"]),
        Switch(
          value: widget.system["status"],
          onChanged: (bool value) {
            value;
          },
        ),
      ],
    );
  }
}
