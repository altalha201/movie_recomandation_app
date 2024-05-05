import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/data_controller/movie_room_controller.dart';
import '../../../../../controllers/data_controller/serise_room_controller.dart';
import '../../../../widgets/app_progress_indicator.dart';

class ShowTab extends StatefulWidget {
  const ShowTab({super.key});

  @override
  State<ShowTab> createState() => _ShowTabState();
}

class _ShowTabState extends State<ShowTab> {
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized()
        .addPersistentFrameCallback((timeStamp) async {
      setState(() {
        _loading = true;
      });
      await Future.wait([
        Provider.of<MovieRoomController>(
          context,
          listen: false,
        ).getPopular(),
        Provider.of<MovieRoomController>(
          context,
          listen: false,
        ).getTopRated(),
        Provider.of<MovieRoomController>(
          context,
          listen: false,
        ).getUpcoming(),
        Provider.of<SeriseRoomController>(
          context,
          listen: false,
        ).getOnTheAir(),
        Provider.of<SeriseRoomController>(
          context,
          listen: false,
        ).getPopular(),
        Provider.of<SeriseRoomController>(
          context,
          listen: false,
        ).getTopRated(),
      ]);
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (_loading) {
          return const AppProgressIndicator();
        }
        return const _TabBody();
      },
    );
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
