import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/features/function/models/appbar.dart';
import 'package:flutter/material.dart';

class AddManually extends StatelessWidget {
  const AddManually({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'Add Manualy'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Container(

        ),
      ),
    );
  }
}
