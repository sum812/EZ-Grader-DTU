// generic text
const String tLogin = "Login";
const String tSignUp = "Signup";
const String tEmail = "Email";
const String tEmailOrPhone = "Email or Phone Number";
const String tPassword = "Password";
const String tConfirmPassword = "Confirm Password";
const String tForgetPassword = "Forget Password?";
const String tSignInWithGoogle = "Sign-In with Google";
const String tFirstName = "First Name";
const String tLastName = "Last Name";
const String tPhoneNumber = "Phone Number";

// splash screen string
const String tAppName = "EZ Grader - DTU";
const String tAppTag = "Improve Knowledge\nImprove Quality";

// on boarding screen string
const String tOnBoardingTitle1 = "EZ Grader DTU:\nYour Smart Grading Solution";
const String tOnBoardingTitle2 = "Effortless Grade Management\nwith EZ Grader DTU";
const String tOnBoardingTitle3 = "Streamlining Your Grading Process";
const String tOnBoardingSubTitle1 = "Optimize your time and accuracy in grading your exams";
const String tOnBoardingSubTitle2 = "The perfect aid for teachers and students facing assessments";
const String tOnBoardingSubTitle3 = "Professional grading with an easy-to-use integrated app";

// welcome screen string
const String tSubHeading = "Have a great day ❤️";
const String tHeading = "EZ Grader - DTU";
const String tWelcomeTag = "welcome-image-tag";

// login screen string
const String tLoginTitle = "Welcome Back!";
const String tLoginSubTitle = "Professionally and effectively!";
const String tRememberMe = "Remember Me?";
const String tDontHaveAnAccount = "Don't have an account? ";

// signup screen string
const String tSignUpTitle = "Get On Board!";
const String tSignUpSubTitle = "Time is money\nThe quiz making app helps you save both!";
const String tAlreadyHaveAnAccount = "Already have an account? ";

// forgot password string
const String tForgetPasswordTitle = "Make Selection!";
const String tForgetPasswordSubTitle = "Select one of the options given below to reset your password!";
const String tEmailTitle = "Email Verification";
const String tPhoneNumberTitle = "Phone Number Verification";
const String tResetViaEmail = "Reset via Email verification";
const String tResetViaPhone = "Reset via Phone number verification";
const String tEmailSubTitle = "Enter Email to receive OTP";
const String tPhoneNumberSubTitle = "Enter Phone Number to receive OTP";
const String tNext = "Next";

// OTP
const String tOtpTitle = "CO\nDE";
const String tOtpSubTitle = "Verification";
const String tOtpMessage = "Enter the verification code sent at";
const String tEmailSupport = "sssum812@gmail.com";

// Home Screen
final now = DateTime.now();

String tHomeTitle = (now.hour >= 6 && now.hour < 12)
    ? "Good morning! ☀️"
    : (now.hour >= 12 && now.hour < 18)
        ? "Good afternoon! 🌤️"
        : "Good evening! 🌙";

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

// guide screen
const String tGuideAppBar = "Detailed Instructions";
const String tGuideTitle = "Thank you for choosing EZ Grader!";

const String tGuideStep1 = "Step 1: Download the test form";
const String tGuideStep2 = "Step 2: Create a new exam";
const String tGuideStep3 = "Step 3: Go to the exam and add answers";
const String tGuideStep4 = "Step 4: Mark the test";
const String tGuideStep5 = "Step 5: Export scores or view statistics";

const String tGuideDetailStep1 = "- Go to the Exam Form section to select the paper form and download it";
const String tGuideDetailStep2 = "- Go to Create Exam to create a new exam";
const String tGuideDetailStep3 = "- After creating an exam, go to that exam and add answers";
const String tGuideDetailStep4 = "- Enter the exam and go to the grading section to grade";
const String tGuideDetailStep5 = "- After scoring, you can view the score chart statistics or you can also export the scores to an excel file";

const String tGuideErrorTitle = "Some common errors";
const String tGuideErrorTitle1 = "– Some errors in coloring SBD and Code:";
const String tGuideErrorTitle2 = "– Some other errors when filling in answers:";
const String tGuideError1 = "Filled in the wrong SBD or code";
const String tGuideError2 = "Do not paint SBD, Plantain or paint too light";
const String tGuideError3 = "Cross out the wrong answer => The machine will understand it as 1 question filled with 2 answers";
const String tGuideError4 = "Uneven, light coloring => the machine will not receive the answer";
const String tGuideError5 = "Painting too light because you used a mechanical pencil => the machine will not receive the answer";
const String tGuideTotal = "A few notes when taking multiple choice tests";
const String tGuideTotalDetail = "– You should answer all the questions (fill in the answers for all questions).\n"
    "– Use pencils coded 2B or higher, you should use large pencils to save time. "
    "Do not use a mechanical pencil to shade (because this pencil cannot shade)."
    "\n– Make it bold so that the machine can read the answer well, do not highlight it."
    "\n– Highlight the answer. If it's wrong, erase it (if you don't erase it, "
    "you can still be considered to have highlighted that answer) and highlight another answer."
    "\n– Do not let ink stick or draw on other answer boxes to avoid being mistaken for the answer."
    "\n– Positioning angles of the answer sheet: absolutely do not paint/write/dirty/blur. "
    "If the positioning corner is painted, dirty, etc., the software will not be able to grade "
    "the test and the test will receive 0 (zero) points.\n– Keep the multiple-choice answer "
    "sheet flat, do not fold it, or roll it up.\nI hope you study and review effectively and do "
    "your homework with high results.";

// Form exam
const String tFormExamAppBar = "Download the form";
const String tForm20Btn = "Form 20";
const String tForm40Btn = "Form 40";
const String tForm50Btn = "Form 50";
const String tForm60Btn = "Form 60";
const String tForm100Btn = "Form 100";
const String tForm120Btn = "Form 120";

// Profile
const String tProfileTitle = "Profile";
const String tProfileHeading = 'USERNAME';
const String tProfileSubHeading = 'email';
const String tEditProfile = 'Edit Profile';
const String tEditSave = 'Save';

// update profile
const String tDelete = 'Delete';

// settings
const String tSettingTitle = "Settings";

// create exam
const String tCreateExamTitle = 'Create Exam';
const String tExamName = 'Exam name';
const String tExamForm = 'Select the exam paper form';

const String tForm20Selector = "Form 20";
const String tForm40Selector = "Form 40";
const String tForm50Selector = "Form 50";
const String tForm60Selector = "Form 60";
const String tForm100Selector = "Form 100";
const String tForm120Selector = "Form 120";

final List<String> formOptions = [
  tForm20Selector,
  tForm40Selector,
  tForm50Selector,
  tForm60Selector,
  tForm100Selector,
  tForm120Selector,
];
String selectedForm = tForm20Selector;
const String tExamScore = 'Exam Score';
const String tExamType = 'Exam type';
const String tExamMul = 'Multiple choice';
const String tExamMulAndShort = 'Multiple '
    'choice and short answer';

final List<String> typeOptions = [
  tExamMul,
  tExamMulAndShort,
];
String selectedType = 'Multiple choice';
const String tExamQues = 'Question number';
const String tExamSubmit = 'Add';
const String tExamCancel = 'Cancel';

// list Exams
const String tListExamAppBar = 'All Exams';

// function
const String tMultipleTitle = 'Multiple choice answers';
const String tShortTitle = 'Short answer answer';
const String tGradingTitle = 'Grading';
const String tGradedTitle = 'The test has been graded';
const String tStatisticalTitle = 'Statistical';
const String tExportTitle = 'Export';

// add multiple answer
const String tAddMultipleTitle = 'Make Selection!';
const String tAddMultipleSubTitle = 'Select one of the options given below to add multiple answer';
const String tAddManually = 'Manually';
const String tAddManuallyTitle = 'Add Manually';
const String tAddFile = 'File';
const String tAddFileTitle = 'Add By Excel File';
const String tAllAnswer = 'Answer';
const String tAllAnswerTitle = 'View all';
