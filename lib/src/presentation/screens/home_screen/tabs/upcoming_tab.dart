import 'package:flutter/material.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        Padding(
          padding: EdgeInsets.all(24),
          child: Text("Upcoming Tab"),
        ),
      ],
    );
  }
}
