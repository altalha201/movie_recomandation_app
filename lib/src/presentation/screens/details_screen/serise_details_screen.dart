import 'package:flutter/material.dart';

class SeriseDetailsScreen extends StatefulWidget {
  const SeriseDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<SeriseDetailsScreen> createState() => _SeriseDetailsScreenState();
}

class _SeriseDetailsScreenState extends State<SeriseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Serise Details Screen"),
      ),
    );
  }
}
