import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:ez_grader/src/features/authentication/screens/forget_password/forget_password_email/forget_password_mail.dart';
import 'package:ez_grader/src/features/authentication/screens/forget_password/forget_password_options/forgot_password_btn_widget.dart';
import 'package:ez_grader/src/features/authentication/screens/forget_password/forget_password_phone/forget_password_phone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen {
  static Future<dynamic>
      buildShowModalBottomSheet(
          BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(
            tDefaultSize + 10),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Text(
              tForgetPasswordTitle,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall,
            ),
            Text(
              tForgetPasswordSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge,
            ),
            const SizedBox(
              height: tDefaultSize + 20,
            ),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              btnIcon: Icons.email_outlined,
              title: tEmail,
              subTitle: tResetViaEmail,
            ),
            const SizedBox(
              height: tDefaultSize,
            ),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordPhoneScreen());
              },
              btnIcon: Icons.phone,
              title: tPhoneNumber,
              subTitle: tResetViaPhone,
            ),
          ],
        ),
      ),
    );
  }
}
