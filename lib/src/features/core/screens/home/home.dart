import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/controllers/click_to_exit_controller.dart';
import 'package:ez_grader/src/features/core/models/appbar.dart';
import 'package:ez_grader/src/features/core/screens/form_exam/form_exam.dart';
import 'package:ez_grader/src/features/core/screens/guide/guide.dart';
import 'package:ez_grader/src/features/core/screens/home/widgets/row_home_widget.dart';
import 'package:ez_grader/src/features/core/screens/list_exams/list_exams.dart';
import 'package:ez_grader/src/features/core/screens/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../databases/repository/user_repository.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ClickToExit clickToExit = ClickToExit();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    Future<void> checkAndCreateUser() async {
      final _auth = FirebaseAuth.instance;
      String? userEmail = _auth.currentUser?.email;

      bool emailExists = await UsersRepository().isEmailExists(userEmail!);

      if (!emailExists) {
        await UsersRepository().createUser(email: userEmail);
        print("User created successfully!");
      } else {
        print("Email already exists in the database!");
      }
    }

    checkAndCreateUser();

    return Scaffold(
      appBar: const AppBarWidget(
        title: 'Home',
        leadingIcon: false,
      ),
      body: SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () async {
            return clickToExit.onWillPop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(tHomePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: tHomePadding,
                ),
                Text(
                  tHomeTitle,
                  style: Theme.of(context).textTheme.headline4?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: tHomePadding * 2,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      RowHomeWidget(
                        size: size,
                        title1: tHomeWidgetListExam,
                        title2: tHomeWidgetFormExam,
                        subTitle1: tHomeWidgetListExamSub,
                        subTitle2: tHomeWidgetFormExamSub,
                        iconData1: Icons.library_add_rounded,
                        iconData2: Icons.download,
                        onTap1: () {
                          Get.to(() => const ListExamsScreen());
                        },
                        onTap2: () {
                          Get.to(() => const FormExamScreen());
                        },
                      ),
                      const SizedBox(
                        height: tHomePadding * 2,
                      ),
                      RowHomeWidget(
                        size: size,
                        title1: tHomeWidgetGuide,
                        title2: tHomeWidgetProfile,
                        subTitle1: tHomeWidgetGuideSub,
                        subTitle2: tHomeWidgetProfileSub,
                        iconData1: Icons.bookmark_add_sharp,
                        iconData2: Icons.person,
                        onTap1: () {
                          Get.to(() => const GuideScreen());
                        },
                        onTap2: () {
                          Get.to(() => const ProfileScreen());
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
    );
  }
}
