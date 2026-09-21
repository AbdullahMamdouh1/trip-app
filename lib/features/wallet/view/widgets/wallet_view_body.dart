import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/localization/localization_extension.dart';

import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_images.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';
import 'package:trip_app/features/drawer/view/widgets/custom_drawer.dart';
import 'package:trip_app/features/wallet/view/widgets/transaction_item.dart';

class WalletViewBody extends StatelessWidget {
  const WalletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        driverName: 'Mostafa',
        rating: 4.8,
        tripsCount: 130,
        onProfileTap: () {},
        onSignOutTap: () {},
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.w16,
            vertical: AppDimens.h12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar Header
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: Container(
                  padding: EdgeInsets.all(AppDimens.r8),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppDimens.r12),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu, color: AppColors.textDark),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              hSpace(AppDimens.h16),

              Text(
                context.l10n.wallet,
                style: AppStyles.bold28.copyWith(
                  fontSize: 32.sp,
                  color: AppColors.textDark,
                ),
              ),
              hSpace(AppDimens.h16),

              _buildTripUCashCard(context),
              hSpace(AppDimens.h24),

              Text(
                context.l10n.earnedToday,
                style: AppStyles.medium16.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 14.sp,
                  letterSpacing: 0.5,
                ),
              ),
              hSpace(AppDimens.h8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.cashIcon,
                        width: 20.w,
                        height: 20.h,
                      ),

                      wSpace(AppDimens.w8),
                      Text(
                        '250 EGP',
                        style: AppStyles.bold18.copyWith(fontSize: 18.sp),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Text(
                          context.l10n.checkAll,
                          style: AppStyles.regular15.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                        wSpace(AppDimens.w4),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: AppColors.textMuted,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              hSpace(AppDimens.h24),

              // Transaction History Header
              Text(context.l10n.transactionHistory, style: AppStyles.bold18),
              hSpace(AppDimens.h16),

              // Today Transactions Group
              Text(
                context.l10n.today,
                style: AppStyles.regular15.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 13.sp,
                ),
              ),
              hSpace(AppDimens.h8),
              TransactionItem(
                title: 'Fawry Transfer',
                time: '06:00 PM',
                amount: '+EGP 100',
                image: AppImages.fawryTransfer,
              ),
              TransactionItem(
                title: 'Card Deposit',
                time: '01:00 AM',
                amount: '+EGP 100',
                image: AppImages.cardDeposit,
              ),
              hSpace(AppDimens.h16),

              // Tuesday, 19 June Transactions Group
              Text(
                'Tuesday, 19 June',
                style: AppStyles.regular15.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 13.sp,
                ),
              ),
              hSpace(AppDimens.h8),
              TransactionItem(
                title: 'Paypal Transfer',
                time: '06:00 PM',
                amount: '+EGP 100',
                image: AppImages.paypalTransfer,
              ),
              TransactionItem(
                title: 'Fawry Transfer',
                time: '06:00 PM',
                amount: '+EGP 100',
                image: AppImages.fawryTransfer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripUCashCard(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppDimens.r20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimens.r20),
        border: Border.all(color: AppColors.primary, width: 2),
        image: DecorationImage(
          image: AssetImage(AppImages.walletImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.account_balance_wallet_outlined,
                color: AppColors.textDark,
              ),
              wSpace(AppDimens.w8),
              Text(
                context.l10n.tripUCash,
                style: AppStyles.medium16.copyWith(color: AppColors.textDark),
              ),
            ],
          ),
          hSpace(AppDimens.h12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EGP  0.00',
                style: AppStyles.bold28.copyWith(
                  color: AppColors.textDark,
                  fontSize: 32.sp,
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.textDark,
                size: 25,
              ),
            ],
          ),
          hSpace(AppDimens.h20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              elevation: 0,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimens.w16,
                vertical: AppDimens.h10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimens.r12),
              ),
            ),
            onPressed: () {},
            icon: const Icon(Icons.add, size: 18),
            label: Text(
              context.l10n.addFunds,
              style: AppStyles.bold18.copyWith(
                color: AppColors.white,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
