import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/data_controller/person_room_controller.dart';
import '../../../utils/app_colors.dart';
import '../../widgets/app_progress_indicator.dart';
import '../../widgets/table/app_table.dart';
import '../../widgets/title_widget.dart';
import 'utils/genarate_table_data.dart';
import 'widgets/cast_in.dart';
import 'widgets/personal_images.dart';
import 'widgets/personal_short_details.dart';
import 'widgets/social_medias.dart';

class PersonDetailsScreen extends StatefulWidget {
  final int id;
  const PersonDetailsScreen({super.key, required this.id});

  @override
  State<PersonDetailsScreen> createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
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
              return const _PersonDetailsView();
            }
          },
        ),
      ),
    );
  }
}

class _PersonDetailsView extends StatelessWidget {
  const _PersonDetailsView();

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: const [
        PersonalShortDetails(),
        _SocialMediaSection(),
        Divider(
          color: AppColors.dividerGrey,
        ),
        TitleWidget("Biography"),
        _BiograficText(),
        _BioDataSection(),
        PersonalImages(),
        Divider(
          color: AppColors.dividerGrey,
        ),
        TitleWidget("Known For"),
        CastIn()
      ],
    );
  }
}

class _BioDataSection extends StatelessWidget {
  const _BioDataSection();

  @override
  Widget build(BuildContext context) {
    return AppTable(
      table: getTableData(context),
    );
  }
}

class _SocialMediaSection extends StatelessWidget {
  const _SocialMediaSection();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<PersonRoomController>(
      context,
      listen: false,
    ).currentPage.externalIds;
    return SocialMedias(model: data);
  }
}

class _BiograficText extends StatelessWidget {
  const _BiograficText();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Consumer<PersonRoomController>(
        builder: (context, controller, _) {
          final text = controller.currentPage.biography ?? "";
          if (text == "") {
            return const SizedBox.shrink();
          }
          return Text(
            text,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
          );
        },
      ),
    );
  }
}
