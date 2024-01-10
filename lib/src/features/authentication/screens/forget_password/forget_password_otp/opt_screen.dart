import 'package:ez_grader/src/constants/sizes.dart';
import 'package:ez_grader/src/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding:
              const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              Text(
                tOtpTitle,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 80.0),
              ),
              Text(
                tOtpSubTitle.toUpperCase(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0),
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              const Text(
                tOtpMessage,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
              ),
              const Text(
                tEmailSupport,
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16),
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              OtpTextField(
                numberOfFields: 6,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                fillColor:
                    Colors.black.withOpacity(0.1),
                filled: true,
                textStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium,
                onSubmit: (code) {
                  print("Verification = " + code);
                },
              ),
              const SizedBox(height: tDefaultSize,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    tNext,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
