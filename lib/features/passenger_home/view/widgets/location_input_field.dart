import 'package:flutter/material.dart';
import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class LocationInputField extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;
  final Widget? trailing;
  final bool isText;

  const LocationInputField({
    super.key,
    required this.icon,
    required this.isText,
    required this.iconColor,
    required this.text,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.w16,
        vertical: AppDimens.h14,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimens.r12),
      ),
      child: Row(
        children: [
          isText
              ? Text(
                  "EGP",
                  style: AppStyles.bold18.copyWith(color: AppColors.textDark),
                )
              : Icon(icon, color: iconColor, size: AppDimens.r20),
          wSpace(AppDimens.w12),
          Expanded(
            child: Text(
              text,
              style: AppStyles.medium16.copyWith(color: AppColors.textDark),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          ?trailing,
        ],
      ),
    );
  }
}
