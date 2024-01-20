import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/models/users_model.dart';
import 'package:ez_grader/src/features/core/controllers/logout_controller.dart';
import 'package:ez_grader/src/features/core/controllers/profile_controller.dart';
import 'package:ez_grader/src/features/core/models/appbar.dart';
import 'package:ez_grader/src/features/core/screens/profile/widgets/ProfileMenuWidget.dart';
import 'package:ez_grader/src/features/core/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logoutController =
    Get.put(LogOutController());
    final profileController = Get.put(
        ProfileController());

    return Scaffold(
      appBar: const AppBarWidget(
        title: tProfileTitle,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(
              tProfilePadding),
          child: FutureBuilder(
            future: profileController
                .getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState ==
                  ConnectionState.done) {
                if (snapshot.hasData) {
                  UsersModel userData = snapshot
                      .data as UsersModel;
                  return Column(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(
                                100),
                            child: const Image(image: AssetImage(tAvatarImage),
                            )),
                      ),
                      const SizedBox(
                        height: tDefaultSize - 10,
                      ),
                      Text(
                        '${userData
                            .first_name} ${userData
                            .last_name}',
                        // tProfileHeading,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        userData.email,
                        // tProfileSubHeading,
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                            fontSize: 17,
                            fontWeight:
                            FontWeight.normal),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () =>
                              Get.to(() =>
                              const EditProfileScreen()),
                          style: ElevatedButton
                              .styleFrom(
                              padding:
                              const EdgeInsets
                                  .all(0),
                              shape:
                              const StadiumBorder()),
                          child: const Text(
                            tEditProfile,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: tDefaultSize,
                      ),
                      const Divider(),
                      const SizedBox(
                        height: tDefaultSize,
                      ),

                      // Menu
                      ProfileMenuWidget(
                          title: 'Settings',
                          icon: LineAwesomeIcons
                              .cog,
                          onPress: () =>
                              Get.to(() =>
                              const SettingsScreen())),
                      ProfileMenuWidget(
                        title: 'Logout',
                        icon: LineAwesomeIcons
                            .alternate_sign_out,
                        textColor: Colors.red,
                        endIcon: false,
                        onPress: () {
                          logoutController
                              .showLogoutConfirmationDialog(
                              context);
                        },
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text(
                      snapshot.error
                          .toString()),);
                } else {
                  return const Center(child: Text(
                      'Something went wrong!'),);
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
      ),
    );
  }
}
