import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/core/models/appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context)
            .platformBrightness ==
        Brightness.dark;
    return Scaffold(
      appBar: const AppBarWidget(title: tSettingTitle, isAction: true,),
      body: SingleChildScrollView(
        child: Container(

        ),
      ),
    );
  }
}
