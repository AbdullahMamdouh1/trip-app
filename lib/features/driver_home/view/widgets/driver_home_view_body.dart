import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_app/core/localization/localization_extension.dart';
import 'package:trip_app/core/shared/custom_button.dart';

import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_images.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';
import 'package:trip_app/features/drawer/view/widgets/custom_drawer.dart';
import 'package:trip_app/features/driver_home/view/widgets/custom_numpad.dart';
import 'package:trip_app/features/driver_home/view/widgets/online_offline_toggle.dart';
import 'package:trip_app/features/driver_home/view/widgets/passenger_request_card.dart';

enum DriverStep {
  requestsList,
  requestDetail,
  customNumpad,
  waitingReply,
  headingToUser,
}

class DriverHomeViewBody extends StatefulWidget {
  const DriverHomeViewBody({super.key});

  @override
  State<DriverHomeViewBody> createState() => _DriverHomeViewBodyState();
}

class _DriverHomeViewBodyState extends State<DriverHomeViewBody> {
  DriverStep _currentStep = DriverStep.requestsList;
  bool _isOnline = true;
  String _inputFare = '59';

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
        child: Stack(
          children: [
            if (_currentStep == DriverStep.requestsList)
              _buildRequestsListSection()
            else
              _buildMapBackgroundWithSheet(),

            if (_currentStep == DriverStep.waitingReply)
              Container(
                color: Colors.black.withValues(alpha: 0.75),
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(AppDimens.defaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentStep = DriverStep.requestDetail;
                          });
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.white,
                          size: 20.sp,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                context.l10n.offeringYourFare,
                                style: AppStyles.bold28.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            hSpace(AppDimens.h8),
                            Text(
                              '$_inputFare EGP',
                              style: AppStyles.bold28.copyWith(
                                color: AppColors.white,
                                fontSize: 36.sp,
                              ),
                            ),
                            hSpace(AppDimens.h12),
                            Text(
                              context.l10n.waitingForReply,
                              style: AppStyles.medium16.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestsListSection() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.w16,
            vertical: AppDimens.h12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu, color: AppColors.textDark),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),
              OnlineOfflineToggle(
                isOnline: _isOnline,
                onChanged: (val) => setState(() => _isOnline = val),
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                  color: AppColors.textDark,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        const Divider(height: 1, color: Colors.grey),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return PassengerRequestCard(
                name: 'Mostafa',
                rating: 4.8,
                ratingsCount: 130,
                pickupLocation: '6th October City',
                dropoffLocation: 'مدخل الشباب 70 متر مجاورة 1',
                fareAndDistanceText: 'EGP 30 ~ 2.1KM',
                timeText: '5 Min',
                onTap: () {
                  setState(() {
                    _currentStep = DriverStep.requestDetail;
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMapBackgroundWithSheet() {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppImages.dummyMap, fit: BoxFit.cover),
        ),
        Positioned(
          top: AppDimens.h16,
          left: AppDimens.w16,
          child: Container(
            padding: EdgeInsets.all(AppDimens.r8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppDimens.r12),
            ),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: AppColors.textDark),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimens.r24),
                topRight: Radius.circular(AppDimens.r24),
              ),
            ),
            child: SingleChildScrollView(
              child: _buildDriverBottomSheetContent(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDriverBottomSheetContent() {
    switch (_currentStep) {
      case DriverStep.requestDetail:
        return _buildRequestDetailBottomSheet();
      case DriverStep.customNumpad:
        return _buildNumpadBottomSheet();
      case DriverStep.waitingReply:
        return _buildRequestSummaryTile();
      case DriverStep.headingToUser:
        return _buildHeadingToUserBottomSheet();
      default:
        return const SizedBox();
    }
  }

  Widget _buildRequestSummaryTile() {
    return PassengerRequestCard(
      name: 'Mostafa',
      rating: 4.8,
      ratingsCount: 130,
      pickupLocation: '6th October City',
      dropoffLocation: 'مدخل الشباب 70 متر مجاورة 1',
      fareAndDistanceText: 'EGP 30 ~ 2.1KM',
      timeText: '5 Min',
    );
  }

  Widget _buildRequestDetailBottomSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            _buildRequestSummaryTile(),
            Positioned(
              top: 129.h,
              right: 100.w,
              left: 0,
              child: Container(
                width: 200.w,
                height: 6.h,

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppDimens.r8),
                    topRight: Radius.circular(AppDimens.r8),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(AppDimens.defaultPadding),
          child: Column(
            children: [
              CustomButton(
                text: context.l10n.acceptFor(50),
                onPressed: () {
                  setState(() {
                    _currentStep = DriverStep.headingToUser;
                  });
                },
              ),
              hSpace(AppDimens.h16),
              Text(
                context.l10n.offerYourFare,
                style: AppStyles.medium16.copyWith(color: AppColors.textDark),
              ),
              hSpace(AppDimens.h12),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: '55',
                      onPressed: () => setState(
                        () => _currentStep = DriverStep.waitingReply,
                      ),
                    ),
                  ),
                  wSpace(AppDimens.w8),
                  Expanded(
                    child: CustomButton(
                      text: '60',
                      onPressed: () => setState(
                        () => _currentStep = DriverStep.waitingReply,
                      ),
                    ),
                  ),
                  wSpace(AppDimens.w8),
                  Expanded(
                    child: CustomButton(
                      text: '65',
                      onPressed: () => setState(
                        () => _currentStep = DriverStep.waitingReply,
                      ),
                    ),
                  ),
                  wSpace(AppDimens.w8),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _currentStep = DriverStep.customNumpad;
                      });
                    },
                    child: Container(
                      height: 48.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppDimens.r12),
                      ),
                      child: const Icon(
                        Icons.edit_outlined,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              hSpace(AppDimens.h12),
              CustomButton(
                text: context.l10n.skip,
                color: const Color(0xff1E293B),
                onPressed: () {
                  setState(() {
                    _currentStep = DriverStep.requestsList;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNumpadBottomSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        hSpace(AppDimens.h16),
        Text(context.l10n.offerYourFare, style: AppStyles.medium16),
        hSpace(AppDimens.h12),
        Text(
          _inputFare.isEmpty ? '0' : _inputFare,
          style: AppStyles.bold28.copyWith(fontSize: 42.sp),
        ),
        hSpace(AppDimens.h8),
        Divider(height: 1, color: Colors.grey),
        hSpace(AppDimens.h8),
        Text(
          context.l10n.customerOffer(50),
          style: AppStyles.medium16.copyWith(color: AppColors.textDark),
        ),
        hSpace(AppDimens.h16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
          child: CustomButton(
            text: context.l10n.offer,
            onPressed: () {
              setState(() {
                _currentStep = DriverStep.waitingReply;
              });
            },
          ),
        ),
        hSpace(AppDimens.h16),
        CustomNumpad(
          onDigitPressed: (digit) {
            setState(() {
              if (_inputFare == '0') {
                _inputFare = digit;
              } else {
                _inputFare += digit;
              }
            });
          },
          onDeletePressed: () {
            setState(() {
              if (_inputFare.isNotEmpty) {
                _inputFare = _inputFare.substring(0, _inputFare.length - 1);
              }
            });
          },
        ),
      ],
    );
  }

  Widget _buildHeadingToUserBottomSheet() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            _buildRequestSummaryTile(),
            Positioned(
              top: 129.h,
              right: 100.w,
              left: 0,
              child: Container(
                width: 200.w,
                height: 6.h,

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppDimens.r8),
                    topRight: Radius.circular(AppDimens.r8),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(AppDimens.defaultPadding),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(AppDimens.r12),
                decoration: BoxDecoration(
                  color: AppColors.lightBlueBg,
                  borderRadius: BorderRadius.circular(AppDimens.r12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.access_time_filled,
                      color: AppColors.primary,
                    ),
                    wSpace(AppDimens.w8),
                    Text(
                      context.l10n.pickupTime('10:00'),
                      style: AppStyles.medium16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              hSpace(AppDimens.h16),

              Container(
                height: 50.h,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppDimens.r12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppDimens.r20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.swapToStartTrip,
                        style: AppStyles.medium16.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Image.asset(
                        AppImages.arrowForward,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
