import 'package:flutter/material.dart';

class ShowTab extends StatelessWidget {
  const ShowTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const _TabBody();
  }
}

class _TabBody extends StatelessWidget {
  const _TabBody();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(),
    );
  }
}
