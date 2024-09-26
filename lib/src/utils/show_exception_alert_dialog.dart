part of 'alert_dialogs.dart';

Future<void> showExceptionAlertDialog({
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    showAlertDialog(
      context: context,
      title: title,
      content: _message(exception),
      defaultActionText: 'OK',
    );

String _message(dynamic exception) {
  if (exception is FirebaseAuthException) {
    return _errors[exception.code] ??
        'An unknown error occurred. Please try again later.';
  }
  if (exception is FirebaseException) {
    return exception.message ??
        'An unknown error occurred. Please try again later.';
  }
  if (exception is PlatformException) {
    return exception.message ?? exception.toString();
  }
  if (exception is Exception) {
    return exception.toString().split('Exception: ')[1];
  }
  return exception.toString();
}

// TODO: Revisit this
// NOTE: The full list of FirebaseAuth errors is stored here:
// https://github.com/firebase/firebase-ios-sdk/blob/2e77efd786e4895d50c3788371ec15980c729053/Firebase/Auth/Source/FIRAuthErrorUtils.m
// These are just the most relevant for email & password sign in:
Map<String, String> _errors = {
  'weak-password': 'The password must be 8 characters long or more.',
  'invalid-credential': 'The email address is badly formatted.',
  'email-already-in-use':
      'The email address is already registered. Sign in instead',
  'invalid-email': 'The email address is badly formatted.',
  'wrong-password': 'The password is incorrect. Please try again.',
  'user-not-found': 'The email address is not registered. Need an account?',
  'too-many-requests':
      'We have blocked all requests from this device due to unusual activity. Try again later.',
  'operation-not-allowed':
      'This sign in method is not allowed. Please contact support.',
};
