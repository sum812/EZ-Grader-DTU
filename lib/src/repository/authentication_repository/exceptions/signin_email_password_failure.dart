class SignInWithEmailAndPasswordFailure {
  final String message;

  const SignInWithEmailAndPasswordFailure([this.message = "An Unknown error occurred."]);

  factory SignInWithEmailAndPasswordFailure.code(String code) {
    switch(code) {
      case 'user-not-found': return const SignInWithEmailAndPasswordFailure('No user found for that email.');
      case 'wrong-password': return const SignInWithEmailAndPasswordFailure('Wrong password provided for that user.');
      default: return const SignInWithEmailAndPasswordFailure();
    }
  }
}