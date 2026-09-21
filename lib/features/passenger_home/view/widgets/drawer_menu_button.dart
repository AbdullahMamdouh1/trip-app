import 'package:flutter/material.dart';
import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';

class DrawerMenuButton extends StatelessWidget {
  final VoidCallback onTap;

  const DrawerMenuButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: AppDimens.h50,
      left: AppDimens.w16,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(AppDimens.r12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(AppDimens.r12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: AppDimens.shadowBlurRadius,
              ),
            ],
          ),
          child: const Icon(Icons.menu, color: AppColors.textDark),
        ),
      ),
    );
  }
}
