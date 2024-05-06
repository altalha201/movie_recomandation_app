import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/exports.dart';

class SeriseDetailsScreen extends StatefulWidget {
  final int id;
  const SeriseDetailsScreen({super.key, required this.id});

  @override
  State<SeriseDetailsScreen> createState() => _SeriseDetailsScreenState();
}

class _SeriseDetailsScreenState extends State<SeriseDetailsScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<SeriseRoomController>(
          context,
          listen: false,
        ).getInfo(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SeriseRoomController>(
      builder: (context, provider, _) {
        if (provider.loadingScreen) {
          return const AppProgressIndicator();
        } else {
          if (provider.currentPage.isNull ?? false) {
            return const ErrorScreen();
          }
          return const _SeriesView();
        }
      },
    );
  }
}

class _SeriesView extends StatelessWidget {
  const _SeriesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<SeriseRoomController>(
          builder: (context, provider, _) => Text(
            provider.currentPage.name ?? "Unknon",
          ),
        ),
      ),
    );
  }
}
