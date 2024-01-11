import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/screens/forget_password/forget_password_options/forgot_password_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/screens/home/home.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: tFormHeight),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
                labelText: tEmail,
                hintText: tEmail,
              ),
            ),
            const SizedBox(
                height: tFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_outline,
                ),
                labelText: tPassword,
                hintText: tPassword,
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(
                      Icons.remove_red_eye_sharp),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen
                        .buildShowModalBottomSheet(
                            context);
                  },
                  child: const Text(
                    tForgetPassword,
                    style:
                        TextStyle(fontSize: 18),
                  )),
            ),
            const SizedBox(
                height: tFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => HomeScreen());
                },
                child: Text(
                  tLogin.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
