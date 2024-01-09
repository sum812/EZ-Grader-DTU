import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:flutter/material.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: tFormHeight - 10),
      child: Form(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            TextFormField(
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
            TextFormField(
              decoration: const InputDecoration(
                label: Text(tConfirmPassword),
                prefixIcon: Icon(
                  Icons.lock_outline,
                ),
                hintText: tConfirmPassword,
              ),
            ),
            const SizedBox(
                height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
