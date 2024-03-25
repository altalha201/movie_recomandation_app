import 'package:flutter/material.dart';

class MovieTab extends StatelessWidget {
  const MovieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        Padding(
          padding: EdgeInsets.all(24),
          child: Text("Movie Tab"),
        ),
      ],
    );
  }
}
