import 'package:flutter/material.dart';
import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class RideTypeCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const RideTypeCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: AppDimens.h12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.lightBlueBg
                : AppColors.cardBackground,
            borderRadius: BorderRadius.circular(AppDimens.r12),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Image.asset(
                imagePath,
                height: AppDimens.h20,
                fit: BoxFit.contain,
              ),
              hSpace(AppDimens.h6),
              Text(
                title,
                style: AppStyles.bold18.copyWith(
                  color: AppColors.textDark,
                  fontSize: AppDimens.sp16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
