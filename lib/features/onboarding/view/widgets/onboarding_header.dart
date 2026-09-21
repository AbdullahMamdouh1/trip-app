import 'package:flutter/material.dart';
import 'package:trip_app/core/localization/localization_extension.dart';
import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class OnboardingHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onSkipTap;
  final bool isLastPage;

  const OnboardingHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onSkipTap,
    required this.isLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                style: AppStyles.bold28.copyWith(color: AppColors.white),
              ),
            ),
            wSpace(AppDimens.w12),
            isLastPage
                ? const SizedBox.shrink()
                : GestureDetector(
                    onTap: onSkipTap,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.w4,
                        vertical: AppDimens.h4,
                      ),
                      child: Text(
                        context.l10n.skip,
                        style: AppStyles.semiBold15.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
          ],
        ),
        hSpace(AppDimens.h12),
        Text(
          subtitle,
          style: AppStyles.regular12.copyWith(
            color: AppColors.white,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
