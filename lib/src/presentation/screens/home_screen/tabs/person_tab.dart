import 'package:flutter/material.dart';

class PersonTab extends StatelessWidget {
  const PersonTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        Padding(
          padding: EdgeInsets.all(24),
          child: Text("Person Tab"),
        ),
      ],
    );
  }
}
