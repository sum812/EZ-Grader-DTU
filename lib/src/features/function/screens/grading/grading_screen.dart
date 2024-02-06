import 'package:flutter/material.dart';
import '../../../../models/exams.dart';

class GradingScreen extends StatefulWidget {
  final Exams exam;
  const GradingScreen({Key? key, required this.exam}) : super(key: key);

  @override
  State<GradingScreen> createState() => _GradingScreenState();
}

class _GradingScreenState extends State<GradingScreen> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
