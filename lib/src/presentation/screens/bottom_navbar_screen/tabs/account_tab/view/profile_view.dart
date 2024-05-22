import 'package:flutter/material.dart';
import 'package:movie_recomandation_app/src/controllers/data_controller/profile_data_controller.dart';
import 'package:movie_recomandation_app/src/utils/exports.dart';
import 'package:movie_show_api/movie_show_api.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            _ProfileDetailsSection(),
          ],
        ),
      ),
    );
  }
}

class _ProfileDetailsSection extends StatelessWidget {
  const _ProfileDetailsSection();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileDataController>(builder: (context, provider, _) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 56,
              backgroundColor: Colors.amber,
              child: CircleAvatar(
                radius: 52,
                backgroundImage: NetworkImage(
                  EndPoints.getProfileImage(
                    provider.userProfile.profileImgId ?? 1,
                  ),
                ),
                backgroundColor: Colors.amber,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.userProfile.fullName ?? "",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        "@${provider.userProfile.userName}\t\t|",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey,
                                ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<AuthController>().logOut();
                        },
                        child: Text(
                          "\t\tLog Out",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.amber,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
