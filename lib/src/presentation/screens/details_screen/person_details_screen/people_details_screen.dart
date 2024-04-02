import 'package:flutter/material.dart';
import 'package:movie_recomandation_app/src/models/person/external_id.dart';
import 'package:movie_recomandation_app/src/presentation/screens/details_screen/content_cheacker.dart';
import 'package:movie_recomandation_app/src/presentation/widgets/button/favourite_button.dart';
import 'package:movie_recomandation_app/src/utils/navigation_helper.dart';
import 'package:provider/provider.dart';

import '../../../../controllers/person_room_controller.dart';
import '../../../../models/table/table_model.dart';
import '../../../../utils/app_functions.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/urls.dart';
import '../../../widgets/app_progress_indicator.dart';
import '../../../widgets/cards/list_image_widget.dart';
import '../../../widgets/table/app_table.dart';
import '../../../widgets/title_widget.dart';
import 'social_media_section.dart';

class PeopleDetailsScreen extends StatefulWidget {
  const PeopleDetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<PeopleDetailsScreen> createState() => _PeopleDetailsScreenState();
}

class _PeopleDetailsScreenState extends State<PeopleDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized()
        .addPostFrameCallback((timeStamp) async {
      await Provider.of<PersonRoomController>(
        context,
        listen: false,
      ).getPersonId(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<PersonRoomController>(
          builder: (context, value, child) {
            if (value.pageLoading) {
              return const AppProgressIndicator();
            } else {
              return _bodySection(value);
            }
          },
        ),
      ),
    );
  }

  Widget _bodySection(PersonRoomController value) {
    return ListView(
      shrinkWrap: true,
      children: [
        _firstRow(value),
        if (value.currentPage.extarnalID?.isNotNull ?? false)
          SocalMediaSection(
            model: value.currentPage.extarnalID ?? ExtarnalID(),
          ),
        Divider(
          color: Colors.grey.shade700,
        ),
        const TitleWidget("Biography"),
        _biographyText(value),
        _tableSection(value),
        _profileImageSection(value),
        Divider(
          color: Colors.grey.shade700,
        ),
        const TitleWidget("Known For"),
        _knownForSection(value),
      ],
    );
  }

  Widget _profileImageSection(PersonRoomController value) {
    var list = value.currentPage.images?.profiles;
    if (list?.isEmpty ?? true) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: Constances.listHeight,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list?.length ?? 0,
          itemBuilder: (context, index) => ListImageWidget(
            list?[index].filePath != null
                ? Urls.getImageUrl(list![index].filePath!)
                : Urls.noPosterUrl,
            border: true,
          ),
        ),
      ),
    );
  }

  Widget _knownForSection(PersonRoomController value) {
    List<List<dynamic>> list = [];
    value.currentPage.movieCredits?.cast?.forEach((element) {
      list.add([element.id, "movie", element.posterPath]);
    });
    value.currentPage.movieCredits?.crew?.forEach(
      (element) {
        list.add([element.id, "movie", element.posterPath]);
      },
    );
    value.currentPage.tvCredits?.cast?.forEach(
      (element) {
        list.add([element.id, "tv", element.posterPath]);
      },
    );
    value.currentPage.tvCredits?.crew?.forEach(
      (element) {
        list.add([element.id ?? -1, "tv", element.posterPath ?? "img"]);
      },
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        height: Constances.listHeight,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) => ListImageWidget(
            (list[index][2] != "img") ? Urls.getImageUrl(list[index][2]) : Urls.noPosterUrl,
            border: true,
            onPressed: () {
              NavigationHelper.push(
                context,
                ContentChecker(
                  contentType: list[index][1],
                  contentId: list[index][0],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _tableSection(PersonRoomController value) {
    TableModel model = TableModel(rows: []);
    var details = value.currentPage.details;
    if (details?.gender != null) {
      model.rows.add(
        TableRowModel(title: "Gender", data: details?.getGender ?? ""),
      );
    }
    if (details?.birthday != null) {
      model.rows.add(
        TableRowModel(
          title: "Birth Date",
          data: AppFunctions.getDate(details!.birthday!),
        ),
      );
    }
    if (details?.deathday != null) {
      model.rows.add(
        TableRowModel(
          title: "Death Date",
          data: AppFunctions.getDate(details!.deathday!),
        ),
      );
    }
    if (details?.deathday == null && details?.birthday != null) {
      model.rows.add(
        TableRowModel(
          title: "Age",
          data: "${AppFunctions.getAge(details!.birthday!)} years",
        ),
      );
    }
    if (details?.placeOfBirth != null) {
      model.rows.add(
        TableRowModel(
          title: "Place of Birth",
          data: details?.placeOfBirth ?? "",
        ),
      );
    }
    if (details?.alsoKnownAs?.isNotEmpty ?? false) {
      model.rows.add(
        TableRowModel(
          title: "Also Known As",
          data: details?.getAlsoKnownAsString ?? "",
        ),
      );
    }
    return AppTable(
      table: model,
    );
  }

  Widget _biographyText(PersonRoomController value) {
    String text = value.currentPage.details?.biography ?? "";
    if (text == "") {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }

  Widget _firstRow(PersonRoomController value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _profileImage(value),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _nameSection(value),
              const SizedBox(height: 16),
              FavouriteButton(
                onPressed: () {},
              ),
            ],
          ),
        ),
        const SizedBox(width: 24),
      ],
    );
  }

  Widget _nameSection(PersonRoomController value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(value.currentPage.details?.name ?? "Name"),
      subtitle:
          Text("Known for ${value.currentPage.details?.knownForDepartment}"),
      titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      subtitleTextStyle: Theme.of(context).textTheme.bodyMedium,
      textColor: Colors.white,
    );
  }

  Widget _profileImage(PersonRoomController value) {
    return Container(
      height: Constances.listItemHeight,
      width: Constances.listItemWeight,
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.orange, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            offset: const Offset(1, 5),
            blurStyle: BlurStyle.outer,
            blurRadius: 24,
          )
        ],
        image: DecorationImage(
          image: NetworkImage(
            value.currentPage.details?.profilePath != null
                ? Urls.getImageUrl(value.currentPage.details!.profilePath!)
                : Urls.noPosterUrl,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
