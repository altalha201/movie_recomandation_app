import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/data_controller/movie_room_controller.dart';
import '../../widgets/app_progress_indicator.dart';
import '../error_screen/error_screen.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int id;
  const MovieDetailsScreen({super.key, required this.id});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) async {
        await Provider.of<MovieRoomController>(
          context,
          listen: false,
        ).getInfo(widget.id);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRoomController>(
      builder: (context, provider, _) {
        if (provider.loading) {
          return const AppProgressIndicator();
        } else {
          if (provider.currentMovie.isNull ?? false) {
            return const ErrorScreen();
          }
          return const _MovieView();
        }
      },
    );
  }
}

class _MovieView extends StatelessWidget {
  const _MovieView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<MovieRoomController>(
          builder: (context, provider, _) => Text(
            provider.currentMovie.title ?? "Unknon",
          ),
        ),
      ),
    );
  }
}
