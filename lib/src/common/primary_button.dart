import 'package:flutter/material.dart';
import '../constants/app_sizes.dart';

/// Primary button based on [ElevatedButton].
/// Useful for CTAs in the app.
/// @param text - text to display on the button.
/// @param isLoading - if true, a loading indicator will be displayed instead of
/// the text.
/// @param onPressed - callback to be called when the button is pressed.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.width = double.infinity,
      this.height = Sizes.p48,
      required this.text,
      this.isLoading = false,
      this.onPressed});
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.p16),
          ),
        ),
        child: isLoading
            ? const CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              )
            : Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
      ),
    );
  }
}
