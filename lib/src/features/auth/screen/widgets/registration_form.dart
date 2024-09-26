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
import 'login_form.dart';

class RegistrationForm extends ConsumerStatefulWidget {
  const RegistrationForm({
    super.key,
  });

  @override
  ConsumerState<RegistrationForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<RegistrationForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailSignUpState = ref.watch(emailPasswordSignUpProvider);
    ref.listen<AsyncValue<dynamic>>(
      emailPasswordSignUpProvider,
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
            'Sign up',
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
            textInputAction: TextInputAction.next,
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
          gapH16,
          const Text(
            'Confirm Password',
            style: TextStyle(
              fontSize: Sizes.p16,
              fontWeight: FontWeight.w600,
            ),
          ),
          gapH8,
          TextFormField(
            controller: _confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            obscureText: !_confirmPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Re-enter password',
              hintStyle: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  _confirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onPressed: () {
                  setState(() {
                    _confirmPasswordVisible = !_confirmPasswordVisible;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please re-enter your password';
              } else if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          gapH24,
          PrimaryButton(
              text: 'Sign up',
              isLoading: emailSignUpState.isLoading,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await ref
                      .read(emailPasswordSignUpProvider.notifier)
                      .registerUsingEmailPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                }
              }),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Already have an account?',
                    style: Theme.of(context).textTheme.titleMedium),
                // AgrimateStyles.smallHGap,
                TextButton(
                    onPressed: () {
                      context.goNamed(AppRoute.signIn.name);
                    },
                    child: Text(
                      'Sign in',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    )),
              ],
            ),
          ),
          gapH32,
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
