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
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
              controller: controller.fullName,
              decoration: InputDecoration(
                label: const Text(tFullName),
                prefixIcon: const Icon(
                  Icons.person_outline_rounded,
                ),
                hintText: tFullName,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Full name is required.';
                } else if (value.trim().length < 3) {
                  return 'Full name must have at least 3 characters.';
                }
                return null;
              },
            ),
            const SizedBox(
                height: tFormHeight - 20),
            TextFormField(
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
              controller: controller.email,
              decoration: InputDecoration(
                label: const Text(tEmail),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
                hintText: tEmail,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email or phone number.';
                }

                RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                if (!emailRegex.hasMatch(value)) {
                  return 'Invalid email format.';
                }
                return null;
              },
            ),
            const SizedBox(
                height: tFormHeight - 20),
            TextFormField(
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
              controller: controller.phoneNumber,
              decoration: InputDecoration(
                label: const Text(tPhoneNumber),
                prefixIcon: const Icon(
                  Icons.phone,
                ),
                hintText: tPhoneNumber,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number.';
                }

                RegExp phoneRegex = RegExp(r'^[0-9]+$');

                if (!phoneRegex.hasMatch(value)) {
                  return 'Invalid phone number format.';
                }
                return null;
              },
            ),
            const SizedBox(
                height: tFormHeight - 20),
            TextFormField(
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
              controller: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                label: const Text(tPassword),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                ),
                hintText: tPassword,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required.';
                }

                RegExp passwordRegex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|<>?]).{6,}$');

                if (!passwordRegex.hasMatch(value)) {
                  return 'Password must be at least 6 characters.';
                }

                return null;
              },
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
