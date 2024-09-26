import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/responsive.dart';
import 'widgets/registration_form.dart';

class RegistrationScreen extends ConsumerWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: MobileRegistrationScreen(),
        ),
      ),
    );
  }
}

class MobileRegistrationScreen extends StatelessWidget {
  const MobileRegistrationScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Spacer(),
        Expanded(
          flex: 10,
          child: RegistrationForm(),
        ),
        Spacer(),
      ],
    );
  }
}
