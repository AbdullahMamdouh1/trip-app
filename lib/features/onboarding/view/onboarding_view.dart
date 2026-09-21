import 'package:flutter/material.dart';
import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/features/onboarding/view/widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primary,
      body: OnboardingViewBody(),
    );
  }
}
