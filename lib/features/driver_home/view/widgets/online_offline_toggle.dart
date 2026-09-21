import 'package:flutter/material.dart';
import 'package:trip_app/core/localization/localization_extension.dart';

import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class OnlineOfflineToggle extends StatelessWidget {
  final bool isOnline;
  final ValueChanged<bool> onChanged;

  const OnlineOfflineToggle({
    super.key,
    required this.isOnline,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimens.r4),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppDimens.r28),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () => onChanged(false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.w20,
                vertical: AppDimens.h8,
              ),
              decoration: BoxDecoration(
                color: !isOnline ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(AppDimens.r24),
              ),
              child: Text(
                context.l10n.offline,
                style: AppStyles.medium16.copyWith(
                  color: !isOnline ? AppColors.white : AppColors.textMuted,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => onChanged(true),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.w20,
                vertical: AppDimens.h8,
              ),
              decoration: BoxDecoration(
                color: isOnline ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(AppDimens.r24),
              ),
              child: Text(
                context.l10n.online,
                style: AppStyles.medium16.copyWith(
                  color: isOnline ? AppColors.white : AppColors.textMuted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
