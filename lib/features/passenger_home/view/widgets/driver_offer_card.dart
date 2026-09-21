import 'package:flutter/material.dart';
import 'package:trip_app/core/shared/custom_button.dart';
import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_images.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class DriverOfferCard extends StatelessWidget {
  final String name;
  final double rating;
  final int ridesCount;
  final String carModel;
  final int etaMinutes;
  final int distanceMeters;
  final String fareText;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const DriverOfferCard({
    super.key,
    required this.name,
    required this.rating,
    required this.ridesCount,
    required this.carModel,
    required this.etaMinutes,
    required this.distanceMeters,
    required this.fareText,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppDimens.h12),
      padding: EdgeInsets.all(AppDimens.r16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimens.r16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: AppDimens.shadowBlurRadius,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: AppDimens.r24,
                backgroundColor: AppColors.cardBackground,
                child: Image.asset(
                  AppImages.driverAvatar,
                  width: AppDimens.r40,
                  height: AppDimens.r40,
                ),
              ),
              wSpace(AppDimens.w12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: AppStyles.bold18),
                        wSpace(AppDimens.w8),
                        const Icon(
                          Icons.star,
                          color: AppColors.starYellow,
                          size: 18,
                        ),
                        wSpace(AppDimens.w4),

                        Text(
                          '$rating',
                          style: AppStyles.regular15.copyWith(
                            color: AppColors.textDark,
                          ),
                        ),
                        wSpace(AppDimens.w4),
                        Text(
                          '($ridesCount rides)',
                          style: AppStyles.regular15.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                    hSpace(AppDimens.h4),
                    Text(
                      carModel,
                      style: AppStyles.regular15.copyWith(
                        color: AppColors.textDark,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('$etaMinutes Min', style: AppStyles.regular15),
                  Text(
                    '$distanceMeters m',
                    style: AppStyles.regular15.copyWith(
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ],
          ),
          hSpace(AppDimens.h16),
          Text(fareText, style: AppStyles.bold28),
          hSpace(AppDimens.h16),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'Decline',
                  color: AppColors.white,
                  textColor: AppColors.primary,
                  borderColor: AppColors.primary,
                  onPressed: onDecline,
                ),
              ),
              wSpace(AppDimens.w12),
              Expanded(
                child: CustomButton(
                  text: 'Accept',
                  color: AppColors.primary,
                  textColor: AppColors.white,
                  onPressed: onAccept,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
