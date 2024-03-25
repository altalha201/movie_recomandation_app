import 'package:flutter/material.dart';

class PeopleDetailsScreen extends StatefulWidget {
  const PeopleDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<PeopleDetailsScreen> createState() => _PeopleDetailsScreenState();
}

class _PeopleDetailsScreenState extends State<PeopleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("Person Details Screen"),
      ),
    );
  }
}
