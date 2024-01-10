import 'package:ez_grader/src/common_widgets/forms/form_header_widget.dart';
import 'package:ez_grader/src/constants/image_string.dart';
import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class ForgetPasswordMailScreen
    extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(
                tDefaultSize),
            child: Column(
              children: [
                const SizedBox(
                  height: tDefaultSize * 4,
                ),
                const FormHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tEmailTitle,
                  subTitle:
                      tEmailSubTitle,
                  crossAxisAlignment:
                      CrossAxisAlignment.center,
                  imageHeight: 0.2,
                  heightBetween: tDefaultSize,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: tFormHeight,
                ),
                Form(
                    child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          const InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmail,
                        prefixIcon: Icon(
                            Icons.email_outlined),
                      ),
                    ),
                    const SizedBox(
                      height: tDefaultSize - 10,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              tNext,
                              style: Theme.of(
                                      context)
                                  .textTheme
                                  .titleMedium,
                            ))),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
