import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../models/person/external_id.dart';

class SocialMedias extends StatelessWidget {
  const SocialMedias({
    super.key,
    this.model,
  });

  final ExternalIds? model;

  @override
  Widget build(BuildContext context) {
    if (model == null || !model!.isNotNull) {
      return const SizedBox.shrink();
    }
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
              if (model?.instagramId != null)
                const _MediaIcon(FontAwesomeIcons.instagram),
              if (model?.facebookId != null)
                const _MediaIcon(FontAwesomeIcons.facebook),
              if (model?.tiktokId != null)
                const _MediaIcon(FontAwesomeIcons.tiktok),
              if (model?.imdbId != null)
                const _MediaIcon(FontAwesomeIcons.imdb),
              if (model?.twitterId != null)
                const _MediaIcon(FontAwesomeIcons.xTwitter),
              if (model?.youtubeId != null)
                const _MediaIcon(FontAwesomeIcons.youtube),
            ],
          ),
        ),
      ],
    );
  }
}

class _MediaIcon extends StatelessWidget {
  final IconData iconData;
  const _MediaIcon(this.iconData);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: Colors.white,
      size: 32,
    );
  }
}
