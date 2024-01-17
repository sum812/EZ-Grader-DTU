import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/controllers/login_controller/signup_controller.dart';
import 'package:ez_grader/src/features/authentication/models/users_model.dart';
import 'package:ez_grader/src/features/authentication/screens/signup/validators/signup_validators.dart';
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
    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headlineSmall,
                    controller: controller.firstName,
                    decoration: InputDecoration(
                      label: Text(
                        tFirstName,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      prefixIcon: const Icon(
                        Icons.person_outline_rounded,
                      ),
                      hintText: tFirstName,
                      hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                      errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
                    ),
                    validator: (value) => SignUpValidators.validateName(value, tFirstName),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.4,
                  child: TextFormField(
                    style: Theme.of(context).textTheme.headlineSmall,
                    controller: controller.lastName,
                    decoration: InputDecoration(
                      label: Text(
                        tLastName,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      prefixIcon: const Icon(
                        Icons.person_outline_rounded,
                      ),
                      hintText: tLastName,
                      hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                      errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
                    ),
                    validator: (value) => SignUpValidators.validateName(value, tLastName),
                  ),
                ),
              ],
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              style: Theme.of(context).textTheme.headlineSmall,
              controller: controller.email,
              decoration: InputDecoration(
                label: Text(
                  tEmail,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                ),
                hintText: tEmail,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              validator: (value) => SignUpValidators.validateEmail(value),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              style: Theme.of(context).textTheme.headlineSmall,
              controller: controller.phoneNumber,
              decoration: InputDecoration(
                label: Text(
                  tPhoneNumber,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                prefixIcon: const Icon(
                  Icons.phone,
                ),
                hintText: tPhoneNumber,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) => SignUpValidators.validatePhoneNumber(value),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              style: Theme.of(context).textTheme.headlineSmall,
              controller: controller.password,
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  tPassword,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                ),
                hintText: tPassword,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              validator: (value) => SignUpValidators.validatePassword(value),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              style: Theme.of(context).textTheme.headlineSmall,
              obscureText: true,
              decoration: InputDecoration(
                label: Text(
                  tConfirmPassword,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                prefixIcon: const Icon(
                  Icons.lock_outline,
                ),
                hintText: tConfirmPassword,
                hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.normal),
                errorStyle: const TextStyle(fontSize: 14.0, color: Colors.red),
              ),
              validator: (value) => SignUpValidators.validateConfirmPassword(value, controller.password.text),
            ),
            const SizedBox(height: tFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final user = UsersModel(email: controller.email.text.trim(), phone: controller.phoneNumber.text.trim(), password: controller.password.text, first_name: controller.firstName.text, last_name: controller.lastName.text);
                    SignUpController.instance.createUser(user);
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
