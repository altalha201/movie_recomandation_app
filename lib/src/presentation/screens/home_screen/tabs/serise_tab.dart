import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_recomandation_app/src/controllers/serise_room_controller.dart';
import 'package:provider/provider.dart';

import '../../../widgets/title_widget.dart';

class SeriseTab extends StatelessWidget {
  const SeriseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget("Populer TV Serises"),
          Consumer<SeriseRoomController>(
            builder: (context, controller, _) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.onAirSerise.length,
                itemBuilder: (context, index) => ListTile(
                  tileColor: Colors.white,
                  title: Text(controller.onAirSerise[index].name ?? "Name"),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
