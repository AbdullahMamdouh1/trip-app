import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_app/core/localization/localization_extension.dart';
import 'package:trip_app/core/routing/routes.dart';

import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_images.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class CustomDrawer extends StatefulWidget {
  final String driverName;
  final double rating;
  final int tripsCount;
  final VoidCallback? onProfileTap;
  final VoidCallback? onSignOutTap;

  const CustomDrawer({
    super.key,
    required this.driverName,
    required this.rating,
    required this.tripsCount,
    this.onProfileTap,
    this.onSignOutTap,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      elevation: 0,
      width: MediaQuery.of(context).size.width * 0.78,
      child: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: widget.onProfileTap,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimens.w16,
                  vertical: AppDimens.h20,
                ),
                child: Row(
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
                    wSpace(AppDimens.w12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.driverName,
                            style: AppStyles.bold18.copyWith(fontSize: 14.sp),
                          ),
                          hSpace(AppDimens.h4),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: AppColors.starYellow,
                                size: 20,
                              ),
                              wSpace(AppDimens.w4),
                              Text(
                                '${widget.rating} (${context.l10n.tripsCount(widget.tripsCount)})',
                                style: AppStyles.medium16.copyWith(
                                  color: AppColors.textDark,
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.textDark,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    onTap: () {
                      context.pushReplacement(Routes.driverHomeView);
                    },
                    index: 0,
                    drawerIcon: AppImages.carIcon,
                    title: context.l10n.rides,
                  ),
                  _buildDrawerItem(
                    onTap: () {},
                    index: 1,
                    drawerIcon: AppImages.timeIcon,
                    title: context.l10n.rentByTime,
                  ),
                  _buildDrawerItem(
                    onTap: () {},
                    index: 2,
                    drawerIcon: AppImages.daysIcon,
                    title: context.l10n.rentByDays,
                  ),
                  _buildDrawerItem(
                    onTap: () {
                      context.pushReplacement(Routes.walletView);
                    },
                    index: 3,
                    drawerIcon: AppImages.walletIcon,
                    title: context.l10n.wallet,
                  ),
                  _buildDrawerItem(
                    onTap: () {},
                    index: 4,
                    drawerIcon: AppImages.historyIcon,
                    title: context.l10n.requestsHistory,
                  ),
                  _buildDrawerItem(
                    onTap: () {},
                    index: 5,
                    drawerIcon: AppImages.settingsIcon,
                    title: context.l10n.settings,
                  ),
                  _buildDrawerItem(
                    onTap: () {},
                    index: 6,
                    drawerIcon: AppImages.callSupport,
                    title: context.l10n.callSupport,
                  ),
                  _buildDrawerItem(
                    onTap: () {},
                    index: 7,
                    drawerIcon: AppImages.inviteIcon,
                    title: context.l10n.inviteAFriend,
                    textColor: AppColors.primary,
                  ),
                  _buildDrawerItem(
                    onTap: () {
                      context.pushReplacement(Routes.roleSelectionView);
                    },
                    index: 8,
                    drawerIcon: AppImages.signOut,
                    title: context.l10n.signOut,
                    textColor: AppColors.redColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem({
    required int index,
    required String drawerIcon,
    required String title,
    required void Function()? onTap,
    Color? textColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: AppDimens.w20,
            vertical: AppDimens.h4,
          ),
          leading: Image.asset(
            drawerIcon,
            width: AppDimens.r24,
            height: AppDimens.r24,
          ),
          title: Text(
            title,
            style: AppStyles.medium16.copyWith(
              color: textColor ?? AppColors.textDark,
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }
}
