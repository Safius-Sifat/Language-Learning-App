import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../utils/string_extensions.dart';
import '../../controller/auth_controller.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailSignInState = ref.watch(emailPasswordSignInProvider);
    ref.listen<AsyncValue<dynamic>>(
      emailPasswordSignInProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    ref.listen<AsyncValue<dynamic>>(
      signInWithGoogleProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gapH64,
          Text(
            'Sign in',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  // color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          gapH32,
          const Text(
            'Email',
            style: TextStyle(
              fontSize: Sizes.p16,
              fontWeight: FontWeight.w600,
            ),
          ),
          gapH8,
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: const InputDecoration(
              hintText: 'Enter your email here',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!value.isValidEmail()) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          gapH16,
          const Text(
            'Password',
            style: TextStyle(
              fontSize: Sizes.p16,
              fontWeight: FontWeight.w600,
            ),
          ),
          gapH8,
          TextFormField(
            controller: _passwordController,
            textInputAction: TextInputAction.done,
            obscureText: !_passwordVisible,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              hintText: 'Enter password',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  // Change the icon based on the state of the password visibility
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  // Update the state to toggle password visibility
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          gapH24,
          PrimaryButton(
            text: 'Sign in',
            isLoading: emailSignInState.isLoading,
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await ref
                    .read(emailPasswordSignInProvider.notifier)
                    .signInUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
              }
            },
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Don't have an account? ",
                    style: Theme.of(context).textTheme.titleMedium),
                TextButton(
                    onPressed: () {
                      context.goNamed(AppRoute.signUp.name);
                    },
                    child: Text(
                      'Sign up',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    )),
              ],
            ),
          ),
          gapH80,
          gapH48,
          SocialButton(
            text: 'Sign in with Google',
            icon: kGoogleLogo,
            onPressed: () async {
              await ref
                  .read(signInWithGoogleProvider.notifier)
                  .signInUsingGoogle();
            },
          ),
          gapH16,
          SocialButton(
              text: 'Sign in with Apple',
              icon: kAppleLogo,
              onPressed: () async {
                await ref
                    .read(signInWithGoogleProvider.notifier)
                    .signInUsingGoogle();
              }),
          gapH16,
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });
  final String text;
  final String icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p12),
          ),
        ),
        icon: Image.asset(icon),
        label: Text(text),
      ),
    );
  }
}
