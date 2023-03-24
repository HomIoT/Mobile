import 'package:flutter/material.dart';
import 'package:homiot/app/services/api/api.service.dart';
import 'package:homiot/app/services/state/state.service.dart';
import 'package:homiot/app/widgets/system/system.widget.dart';
import 'package:provider/provider.dart';

class SystemScreen extends StatefulWidget {
  const SystemScreen({super.key});

  @override
  State<SystemScreen> createState() => _SystemScreenState();
}

class _SystemScreenState extends State<SystemScreen> {
  final DioClient _client = DioClient();

  @override
  void initState() {
    super.initState();
    getSystems();
  }

  Future<void> _showSnackBar(BuildContext context, String message) async {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        textColor: Colors.blueGrey[100],
        label: 'Close',
        onPressed: () {},
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> getSystems() async {
    var response = _client.all();

    response.then((result) {
      Provider.of<AppState>(context, listen: false).setSystems(result.data);
      _showSnackBar(context, "Systems got successfully");
    }).catchError((error) {});
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> systems =
        Provider.of<AppState>(context, listen: true).getSystems;

    return ListView.builder(
      itemCount: systems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: SystemWidget(system: systems[index]),
        );
      },
    );
  }
}
