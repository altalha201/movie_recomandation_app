import 'package:flutter/material.dart';

class SeriseTab extends StatelessWidget {
  const SeriseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        Padding(
          padding: EdgeInsets.all(24),
          child: Text("Serise Tab"),
        ),
      ],
    );
  }
}
