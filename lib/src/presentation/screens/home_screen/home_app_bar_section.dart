import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/tranding_controllers.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/navigation_helper.dart';
import '../../widgets/app_progress_indicator.dart';
import '../../widgets/home_screen_title_widget.dart';
import '../../widgets/image_slider_item.dart';
import '../account_screen/account_screen.dart';
import '../search_screen/search_screen.dart';

class HomeAppBarSaction extends StatelessWidget {
  const HomeAppBarSaction({
    super.key,
  });

  void onAccountTap(BuildContext context) {
    NavigationHelper.push(
      context,
      const AccountScreen(),
    );
  }

  void onSearchTap(BuildContext context) {
    NavigationHelper.push(
      context,
      const SearchScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.appbarBackground,
      centerTitle: true,
      toolbarHeight: 60,
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      pinned: true,
      title: const HomeScreenTitleWidget(),
      flexibleSpace: backgroundSection(),
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () => onAccountTap(context),
      ),
      actions: [
        IconButton(
          onPressed: () => onSearchTap(context),
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  Widget backgroundSection() {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.parallax,
      background: Consumer<TrandingController>(
        builder: (
          BuildContext context,
          TrandingController value,
          Widget? child,
        ) {
          if (value.isLoading) {
            return const AppProgressIndicator();
          } else {
            return CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                height: MediaQuery.of(context).size.height,
              ),
              items: [
                ...value.trandingList.map(
                  (e) => ImageSliderItem(
                    item: e,
                    trandingAt: value.trandingList.indexOf(e),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
