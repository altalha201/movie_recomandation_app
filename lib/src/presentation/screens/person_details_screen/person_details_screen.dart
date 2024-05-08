import 'package:flutter/material.dart';
import 'package:movie_show_utilites/movie_show_utilites.dart';
import 'package:provider/provider.dart';

import '../../../utils/exports.dart';

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
    return Background(
      child: Scaffold(
        body: SafeArea(
          child: Consumer<PersonRoomController>(
            builder: (context, value, child) {
              if (value.pageLoading) {
                return const AppProgressIndicator();
              } else {
                if (value.currentPage.isNull ?? false) {
                  return const ErrorScreen();
                } else {
                  return const _PersonDetailsView();
                }
              }
            },
          ),
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
          color: MSColors.dividerGrey,
        ),
        TitleWidget("Biography"),
        _BiograficText(),
        _BioDataSection(),
        PersonalImages(),
        Divider(
          color: MSColors.dividerGrey,
        ),
        TitleWidget("Known For"),
        CastIn(),
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
