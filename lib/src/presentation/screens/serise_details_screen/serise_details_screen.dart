import 'package:flutter/material.dart';

class SeriseDetailsScreen extends StatelessWidget {
  final int id;
  const SeriseDetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("App Title"),
      ),
    );
  }
}
