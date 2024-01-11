import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/controllers/login_controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(tFullName),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                ),
                hintText: tFullName,
              ),
            ),
            const SizedBox(
                height: tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                label: Text(tEmail),
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
                hintText: tEmail,
              ),
            ),
            const SizedBox(
                height: tFormHeight - 20),
            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                label: Text(tPhoneNumber),
                prefixIcon: Icon(
                  Icons.phone,
                ),
                hintText: tPhoneNumber,
              ),
            ),
            const SizedBox(
                height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(
                  Icons.lock_outline,
                ),
                hintText: tPassword,
              ),
            ),
            const SizedBox(
                height: tFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                  }
                },
                child: Text(
                  tSignUp.toUpperCase(),
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
