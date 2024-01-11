import 'package:ez_grader/firebase_options.dart';
import 'package:ez_grader/src/features/authentication/screens/signin/signin_screen.dart';
import 'package:ez_grader/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:ez_grader/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:ez_grader/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:ez_grader/src/features/core/screens/home/home.dart';
import 'package:ez_grader/src/repository/authentication_repository/authentication_repository.dart';
import 'package:ez_grader/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    bool isFirstScreen = true;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.rightToLeftWithFade,
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => SplashScreen(),
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            if (isFirstScreen) {
              isFirstScreen = false;
              return child;
            } else {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            }
          },
        );
      },
    );
  }
}
