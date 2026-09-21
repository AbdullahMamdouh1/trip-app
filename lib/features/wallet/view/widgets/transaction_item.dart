import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String time;
  final String amount;
  final String image;

  const TransactionItem({
    super.key,
    required this.title,
    required this.time,
    required this.amount,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.h8),
      child: Row(
        children: [
          Container(
            width: 44.w,
            height: 44.h,
            decoration: const BoxDecoration(
              color: AppColors.cardBackground,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(image.toString(), width: AppDimens.w24),
            ),
          ),
          wSpace(AppDimens.w12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppStyles.bold18.copyWith(fontSize: 15.sp)),
                hSpace(AppDimens.h4),
                Text(
                  time,
                  style: AppStyles.regular15.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: AppStyles.bold18.copyWith(
              color: AppColors.textDark,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}
