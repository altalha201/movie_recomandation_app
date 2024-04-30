import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../controllers/tranding_controllers.dart';
import '../../../../widgets/app_progress_indicator.dart';
import '../../../../widgets/home_screen_title_widget.dart';
import '../../../../widgets/list_item/tranding_list_widget.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const HomeScreenTitleWidget(),
          const SizedBox(
            height: 8,
          ),
          Consumer<TrandingController>(
              builder: (context, trandingController, _) {
            if (trandingController.isLoading) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: const AppProgressIndicator(),
              );
            }
            return CarouselSlider(
              items: [
                ...trandingController.trandingList.map(
                  (trandingItem) => TrandingListWidget(
                    data: trandingItem,
                  ),
                ),
              ],
              options: CarouselOptions(
                viewportFraction: 0.6,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                height: MediaQuery.of(context).size.height * 0.5,
                enlargeCenterPage: true,
              ),
            );
          })
        ],
      ),
    );
  }
}
