import 'package:flutter/material.dart';
import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;

  const OnboardingPageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(count, (index) {
        final isSelected = index == currentIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.only(right: AppDimens.w6),
          height: AppDimens.h8,
          width: isSelected ? AppDimens.w24 : AppDimens.w8,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary800 : AppColors.white,
            borderRadius: BorderRadius.circular(AppDimens.r4),
          ),
        );
      }),
    );
  }
}
