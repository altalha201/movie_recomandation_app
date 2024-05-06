import 'package:flutter/material.dart';

import '../../../../../utils/exports.dart';

class ShowTab extends StatefulWidget {
  const ShowTab({super.key});

  @override
  State<ShowTab> createState() => _ShowTabState();
}

class _ShowTabState extends State<ShowTab> {
  bool _loading = false;
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      setState(() {
        _loading = true;
      });
      await Future.wait(Providers.onLoadUp(context)).then((value) {
        setState(() {
          _loading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (_loading) {
        return const AppProgressIndicator();
      }
      return const _TabBody();
    });
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
