import 'package:ez_grader/firebase_options.dart';
import 'package:ez_grader/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:ez_grader/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ez_grader/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
          options: DefaultFirebaseOptions
              .currentPlatform)
      .then((value) =>
          Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition:
          Transition.rightToLeftWithFade,
      transitionDuration:
          const Duration(milliseconds: 500),
      // home: const OnBoardingScreen(),
      home: const Scaffold(body: Center(child: CircularProgressIndicator(),),)
    );
  }
}
