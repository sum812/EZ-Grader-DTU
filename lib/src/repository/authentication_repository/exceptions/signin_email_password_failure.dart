class SignInWithEmailAndPasswordFailure {
  final String message;

  const SignInWithEmailAndPasswordFailure([this.message = "Something went wrong. Try again!"]);

  factory SignInWithEmailAndPasswordFailure.code(String code) {
    switch(code) {
      // sai mã code
      case 'auth/user-not-found	': return const SignInWithEmailAndPasswordFailure('No user found for that email.');
      case 'wrong-password': return const SignInWithEmailAndPasswordFailure('Wrong password provided for that user.');
      default: return const SignInWithEmailAndPasswordFailure();
    }
  }
}