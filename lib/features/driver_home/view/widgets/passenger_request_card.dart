import 'package:flutter/material.dart';

import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_images.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class PassengerRequestCard extends StatelessWidget {
  final String name;
  final double rating;
  final int ratingsCount;
  final String pickupLocation;
  final String dropoffLocation;
  final String fareAndDistanceText;
  final String timeText;
  final VoidCallback? onTap;

  const PassengerRequestCard({
    super.key,
    required this.name,
    required this.rating,
    required this.ratingsCount,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.fareAndDistanceText,
    required this.timeText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            bottom: BorderSide(color: AppColors.borderColor, width: 1),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppDimens.r16),
              child: Row(
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: AppDimens.r24,
                        backgroundColor: AppColors.cardBackground,
                        child: Image.asset(
                          AppImages.driverAvatar,
                          width: AppDimens.r32,
                          height: AppDimens.r32,
                        ),
                      ),
                      hSpace(AppDimens.h4),
                      Text(name, style: AppStyles.semiBold15),
                      hSpace(AppDimens.h4),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppColors.starYellow,
                            size: 20,
                          ),
                          wSpace(AppDimens.w2),
                          Text(
                            '$rating ($ratingsCount)',
                            style: AppStyles.regular15.copyWith(
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  wSpace(AppDimens.w16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.purple,
                              size: 18,
                            ),
                            wSpace(AppDimens.w6),
                            Expanded(
                              child: Text(
                                pickupLocation,
                                style: AppStyles.medium16.copyWith(
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        hSpace(AppDimens.h6),
                        Row(
                          children: [
                            const Icon(
                              Icons.radio_button_on,
                              color: AppColors.textDark,
                              size: 16,
                            ),
                            wSpace(AppDimens.w6),
                            Expanded(
                              child: Text(
                                dropoffLocation,
                                style: AppStyles.medium16.copyWith(
                                  color: AppColors.textDark,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        hSpace(AppDimens.h8),
                        Text(
                          fareAndDistanceText,
                          style: AppStyles.bold18.copyWith(
                            color: AppColors.textDark,
                            fontSize: 15,
                          ),
                        ),
                        hSpace(AppDimens.h4),
                        Text(
                          timeText,
                          style: AppStyles.medium16.copyWith(
                            color: AppColors.textDark,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: AppColors.textDark,
                    size: 25,
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Colors.grey),
            hSpace(AppDimens.h8),
          ],
        ),
      ),
    );
  }
}
