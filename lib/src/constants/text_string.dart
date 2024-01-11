// generic text

const String tLogin = "Login";
const String tSignUp = "Signup";
const String tEmail = "Email";
const String tPassword = "Password";
const String tConfirmPassword =
    "Confirm Password";
const String tForgetPassword = "Forget Password?";
const String tSignInWithGoogle =
    "Sign-In with Google";
const String tFullName = "Full Name";
const String tPhoneNumber = "Phone Number";

// splash screen string
const String tAppName = "EZ Grader - DTU";
const String tAppTag =
    "Improve Knowledge\nImprove Quality";

// on boarding screen string
const String tOnBoardingTitle1 =
    "EZ Grader DTU:\nYour Smart Grading Solution";
const String tOnBoardingTitle2 =
    "Effortless Grade Management\nwith EZ Grader DTU";
const String tOnBoardingTitle3 =
    "Streamlining Your Grading Process";
const String tOnBoardingSubTitle1 =
    "Optimize your time and accuracy in grading your exams";
const String tOnBoardingSubTitle2 =
    "The perfect aid for teachers and students facing assessments";
const String tOnBoardingSubTitle3 =
    "Professional grading with an easy-to-use integrated app";

// welcome screen string
const String tSubHeading = "Have a great day ❤️";
const String tHeading = "EZ Grader - DTU";
const String tWelcomeTag = "welcome-image-tag";

// login screen string
const String tLoginTitle = "Welcome Back!";
const String tLoginSubTitle =
    "Professionally and effectively!";
const String tRememberMe = "Remember Me?";
const String tDontHaveAnAccount =
    "Don't have an account? ";

// signup screen string
const String tSignUpTitle = "Get On Board!";
const String tSignUpSubTitle =
    "Time is money\nThe quiz making app helps you save both!";
const String tAlreadyHaveAnAccount =
    "Already have an account? ";

// forgot password string
const String tForgetPasswordTitle =
    "Make Selection!";
const String tForgetPasswordSubTitle =
    "Select one of the options given below to reset your password!";
const String tEmailTitle = "Email Verification";
const String tPhoneNumberTitle =
    "Phone Number Verification";
const String tResetViaEmail =
    "Reset via Email verification";
const String tResetViaPhone =
    "Reset via Phone number verification";
const String tEmailSubTitle =
    "Enter Email to receive OTP";
const String tPhoneNumberSubTitle =
    "Enter Phone Number to receive OTP";
const String tNext = "Next";

// OTP
const String tOtpTitle = "CO\nDE";
const String tOtpSubTitle = "Verification";
const String tOtpMessage =
    "Enter the verification code sent at";
const String tEmailSupport = "sssum812@gmail.com";

// Home Screen
final now = DateTime.now();
String tHomeTitle = (now.hour >= 6 &&
        now.hour < 12)
    ? "Good morning USERNAME"
    : (now.hour >= 12 && now.hour < 13)
        ? "Good afternoon USERNAME"
        : (now.hour >= 13 && now.hour < 18)
            ? "Good afternoon USERNAME"
            : (now.hour >= 18 && now.hour < 24)
                ? "Good evening USERNAME"
                : "Good evening USERNAME";


const String tHomeWidgetListExam = "List Exams";
const String tHomeWidgetCreateExam = "Create Exam";
const String tHomeWidgetFormExam = "Form Exam";
const String tHomeWidgetGuide = "Guide";
const String tHomeWidgetSetting = "Settings";
const String tHomeWidgetProfile = "Profile";

const String tHomeWidgetListExamSub = "View All Exams";
const String tHomeWidgetCreateExamSub = "Create Exam";
const String tHomeWidgetFormExamSub = "Choose Form Exam";
const String tHomeWidgetGuideSub = "Guide";
const String tHomeWidgetSettingSub = "Custom";
const String tHomeWidgetProfileSub = "Custom Profile";
