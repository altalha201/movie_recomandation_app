import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../models/person/external_id.dart';

class SocalMediaSection extends StatelessWidget {
  const SocalMediaSection({
    super.key,
    required this.model,
  });

  final ExtarnalID model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Available on",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            spacing: 16.0,
            runSpacing: 4.0,
            children: [
              if (model.instagramId != null)
                _mediaIcon(FontAwesomeIcons.instagram),
              if (model.facebookId != null)
                _mediaIcon(FontAwesomeIcons.facebook),
              if (model.tiktokId != null) _mediaIcon(FontAwesomeIcons.tiktok),
              if (model.imdbId != null) _mediaIcon(FontAwesomeIcons.imdb),
              if (model.twitterId != null)
                _mediaIcon(FontAwesomeIcons.xTwitter),
              if (model.youtubeId != null) _mediaIcon(FontAwesomeIcons.youtube),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mediaIcon(IconData iconData) => Icon(
        iconData,
        color: Colors.white,
        size: 32,
      );
}
