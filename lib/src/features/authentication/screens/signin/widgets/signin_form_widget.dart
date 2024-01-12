import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/controllers/login_controller/signin_controller.dart';
import 'package:ez_grader/src/features/authentication/screens/forget_password/forget_password_options/forgot_password_model_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninForm extends StatelessWidget {
  const SigninForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Get.put(SignInController());
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(
            vertical: tFormHeight),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            TextFormField(
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
              controller: controller.email,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person_outline_outlined,
                ),
                labelText: tEmailOrPhone,
                hintText: tEmailOrPhone,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email or phone number.';
                }

                RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');

                RegExp phoneRegex = RegExp(r'^[0-9]+$');

                if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
                  return 'Invalid email or phone number format.';
                }
                return null;
              },
            ),
            const SizedBox(
                height: tFormHeight - 20),
            TextFormField(
              controller: controller.password,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.lock_outline,
                ),
                labelText: tPassword,
                hintText: tPassword,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
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
                  if (_formKey.currentState!
                      .validate()) {
                    SignInController.instance
                        .loginUser(
                            controller.email.text
                                .trim(),
                            controller
                                .password.text
                                .trim());
                  }
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
