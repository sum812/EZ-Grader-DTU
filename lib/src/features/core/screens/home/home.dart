import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/controllers/click_to_exit_controller.dart';
import 'package:ez_grader/src/features/core/screens/create_exam/create_exam.dart';
import 'package:ez_grader/src/features/core/screens/form_exam/form_exam.dart';
import 'package:ez_grader/src/features/core/screens/guide/guide.dart';
import 'package:ez_grader/src/features/core/screens/home/widgets/row_home_widget.dart';
import 'package:ez_grader/src/features/core/screens/list_exams/list_exams.dart';
import 'package:ez_grader/src/features/core/screens/profile/profile.dart';
import 'package:ez_grader/src/features/core/screens/settings/settings.dart';
import 'package:ez_grader/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ClickToExit clickToExit = ClickToExit();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: WillPopScope(
            onWillPop: () async {
              return clickToExit
                  .onWillPop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(
                  tHomePadding),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: tHomePadding,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      Text(
                        tHomeTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            ?.copyWith(
                                fontSize: 24,
                                fontWeight:
                                    FontWeight
                                        .w600),
                      ),
                      IconButton(
                          onPressed: () {
                            _showLogoutConfirmationDialog(
                                context);
                          },
                          icon: const Icon(
                            Icons.logout,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: tHomePadding * 2,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        RowHomeWidget(
                          size: size,
                          title1:
                              tHomeWidgetListExam,
                          title2:
                              tHomeWidgetCreateExam,
                          subTitle1:
                              tHomeWidgetListExamSub,
                          subTitle2:
                              tHomeWidgetCreateExamSub,
                          iconData1: Icons
                              .library_add_rounded,
                          iconData2: Icons
                              .create_rounded,
                          onTap1: () {
                            Get.to(() =>
                                const ListExamsScreen());
                          },
                          onTap2: () {
                            Get.to(() =>
                                const CreateExamScreen());
                          },
                        ),
                        const SizedBox(
                          height:
                              tHomePadding * 2,
                        ),
                        RowHomeWidget(
                          size: size,
                          title1:
                              tHomeWidgetFormExam,
                          title2:
                              tHomeWidgetGuide,
                          subTitle1:
                              tHomeWidgetFormExamSub,
                          subTitle2:
                              tHomeWidgetGuideSub,
                          iconData1:
                              Icons.download,
                          iconData2: Icons
                              .bookmark_add_sharp,
                          onTap1: () {
                            Get.to(() =>
                                const FormExamScreen());
                          },
                          onTap2: () {
                            Get.to(() =>
                                const GuideScreen());
                          },
                        ),
                        const SizedBox(
                          height:
                              tHomePadding * 2,
                        ),
                        RowHomeWidget(
                          size: size,
                          title1:
                              tHomeWidgetSetting,
                          title2:
                              tHomeWidgetProfile,
                          subTitle1:
                              tHomeWidgetSettingSub,
                          subTitle2:
                              tHomeWidgetProfileSub,
                          iconData1:
                              Icons.settings,
                          iconData2: Icons.person,
                          onTap1: () {
                            Get.to(() =>
                                const SettingsScreen());
                          },
                          onTap2: () {
                            Get.to(() =>
                                const ProfileScreen());
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutConfirmationDialog(
      BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title:
          Center(
            child: Text('Logout Confirmation', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 24),),
          ),
          content: const Text('😒', textAlign: TextAlign.center, style: TextStyle(fontSize: 45),),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel', style: TextStyle(fontSize: 20),),
                ),
                TextButton(
                  onPressed: () {
                    AuthenticationRepository.instance
                        .logout();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Logout', style: TextStyle(fontSize: 20, color: Colors.redAccent),),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
