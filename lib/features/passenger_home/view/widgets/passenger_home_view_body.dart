import 'package:flutter/material.dart';
import 'package:trip_app/core/shared/custom_button.dart';
import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_images.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';
import 'package:trip_app/features/passenger_home/view/widgets/driver_offer_card.dart';
import 'package:trip_app/features/passenger_home/view/widgets/location_input_field.dart';
import 'package:trip_app/features/passenger_home/view/widgets/ride_type_card.dart';

enum PassengerStep {
  initialOffer,
  priceEntered,
  timeEstimated,
  searching,
  driverOffers,
}

class PassengerHomeViewBody extends StatefulWidget {
  const PassengerHomeViewBody({super.key});

  @override
  State<PassengerHomeViewBody> createState() => _PassengerHomeViewBodyState();
}

class _PassengerHomeViewBodyState extends State<PassengerHomeViewBody> {
  PassengerStep _currentStep = PassengerStep.initialOffer;
  int _selectedRideType = 0;
  int _offeredFare = 50;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Map Background
        Positioned.fill(
          child: Image.asset(AppImages.dummyMap, fit: BoxFit.cover),
        ),

        Positioned(
          top: AppDimens.h20,
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: AppColors.textDark),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        _currentStep == PassengerStep.driverOffers
            ? Positioned(
                top: AppDimens.h50,
                left: 0,
                right: 0,
                bottom: 0,

                child: ListView.builder(
                  padding: EdgeInsets.only(
                    left: AppDimens.w16,
                    right: AppDimens.w16,
                    bottom: 200,
                  ),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return DriverOfferCard(
                      name: 'Ahmed',
                      rating: 4.8,
                      ridesCount: 68,
                      carModel: 'Toyota Yaris',
                      etaMinutes: 5,
                      distanceMeters: 750,
                      fareText: '55 EGP',
                      onAccept: () {},
                      onDecline: () {},
                    );
                  },
                ),
              )
            : SizedBox(),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppDimens.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppDimens.r24),
                topRight: Radius.circular(AppDimens.r24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: AppDimens.shadowBlurRadius,
                ),
              ],
            ),
            child: SingleChildScrollView(child: _buildBottomSheetContent()),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSheetContent() {
    switch (_currentStep) {
      case PassengerStep.initialOffer:
      case PassengerStep.priceEntered:
      case PassengerStep.timeEstimated:
        return _buildRideSelectionSection();
      case PassengerStep.searching:
        return _buildSearchingSection();
      case PassengerStep.driverOffers:
        return _buildDriverOffersSection();
    }
  }

  // Step 1 - 3 UI
  Widget _buildRideSelectionSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RideTypeCard(
              title: 'Ride',
              imagePath: AppImages.rideOption,
              isSelected: _selectedRideType == 0,
              onTap: () => setState(() => _selectedRideType = 0),
            ),
            wSpace(AppDimens.w12),
            RideTypeCard(
              title: 'Comfort',
              imagePath: AppImages.comfortOption,
              isSelected: _selectedRideType == 1,
              onTap: () => setState(() => _selectedRideType = 1),
            ),
          ],
        ),
        hSpace(AppDimens.h16),
        LocationInputField(
          isText: false,
          icon: _currentStep == PassengerStep.initialOffer
              ? Icons.location_on
              : Icons.radio_button_checked,
          iconColor: _currentStep == PassengerStep.initialOffer
              ? AppColors.purple
              : AppColors.textDark,
          text: 'Mohammed Ezz El-Arab St',
        ),
        hSpace(AppDimens.h10),
        LocationInputField(
          isText: false,
          icon: _currentStep == PassengerStep.initialOffer
              ? Icons.radio_button_checked
              : Icons.location_on,
          iconColor: _currentStep == PassengerStep.initialOffer
              ? AppColors.textDark
              : AppColors.purple,
          text: 'Ain Shams University',
        ),
        hSpace(AppDimens.h10),
        LocationInputField(
          isText: true,
          icon: Icons.monetization_on_outlined,
          iconColor: AppColors.successGreen,
          text: _currentStep == PassengerStep.initialOffer
              ? 'Offer your fare'
              : '$_offeredFare',
          trailing: Image.asset(AppImages.cashIcon, height: AppDimens.h14),
        ),

        if (_currentStep == PassengerStep.initialOffer) ...[
          hSpace(AppDimens.h12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment',
                style: AppStyles.regular15.copyWith(color: AppColors.textMuted),
              ),
              hSpace(AppDimens.h8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.cashIcon, height: AppDimens.h14),

                      wSpace(AppDimens.w4),
                      Text(
                        'Cash',
                        style: AppStyles.medium16.copyWith(
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Change',
                        style: AppStyles.medium16.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                      wSpace(AppDimens.w4),
                      Icon(
                        Icons.arrow_forward_ios_sharp,

                        color: AppColors.textMuted,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
        if (_currentStep == PassengerStep.timeEstimated) ...[
          hSpace(AppDimens.h12),
          Container(
            padding: EdgeInsets.all(AppDimens.r12),
            decoration: BoxDecoration(
              color: AppColors.lightBlueBg,
              borderRadius: BorderRadius.circular(AppDimens.r12),
            ),
            child: Row(
              children: [
                const Icon(Icons.access_time_filled, color: AppColors.primary),
                wSpace(AppDimens.w8),
                Text(
                  'Travel Time: ~ 15 min.',
                  style: AppStyles.medium16.copyWith(color: AppColors.primary),
                ),
              ],
            ),
          ),
        ],
        hSpace(AppDimens.h16),
        CustomButton(
          text: _currentStep == PassengerStep.timeEstimated
              ? 'Find a Ride'
              : 'Confirm',
          onPressed: () {
            setState(() {
              if (_currentStep == PassengerStep.initialOffer) {
                _currentStep = PassengerStep.priceEntered;
              } else if (_currentStep == PassengerStep.priceEntered) {
                _currentStep = PassengerStep.timeEstimated;
              } else if (_currentStep == PassengerStep.timeEstimated) {
                _currentStep = PassengerStep.searching;
              }
            });
          },
        ),
      ],
    );
  }

  // Step 4 Searching & Raising Fair
  Widget _buildSearchingSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('No drivers available...?', style: AppStyles.regular15),
        hSpace(AppDimens.h4),
        Text(
          'Increase your fare for a quicker match.',
          style: AppStyles.regular15,
        ),
        hSpace(AppDimens.h20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.r8),
                ),
              ),

              onPressed: () => setState(() => _offeredFare += 5),
              child: const Text(
                '+ 5',
                style: TextStyle(color: AppColors.white),
              ),
            ),
            wSpace(AppDimens.w20),
            Text('$_offeredFare EGP', style: AppStyles.bold28),
            wSpace(AppDimens.w20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppDimens.r8),
                ),
              ),
              onPressed: () => setState(() => _offeredFare += 5),
              child: const Text(
                '+ 5',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ],
        ),
        hSpace(AppDimens.h20),
        CustomButton(
          text: 'Raise fare',
          onPressed: () {
            setState(() {
              _currentStep = PassengerStep.driverOffers;
            });
          },
        ),
        hSpace(AppDimens.h10),
        CustomButton(
          text: 'Cancel request',
          color: AppColors.white,
          textColor: AppColors.primary,
          borderColor: AppColors.primary,
          onPressed: () {
            setState(() {
              _currentStep = PassengerStep.initialOffer;
            });
          },
        ),
        hSpace(AppDimens.h20),
        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.purple),
            wSpace(AppDimens.w8),
            Text(
              'Ain Shams University',
              style: AppStyles.medium16.copyWith(color: AppColors.textDark),
            ),
          ],
        ),
        hSpace(AppDimens.h8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "EGP",
                  style: AppStyles.bold18.copyWith(color: AppColors.textDark),
                ),

                wSpace(AppDimens.w8),
                Text(
                  '$_offeredFare',
                  style: AppStyles.medium16.copyWith(color: AppColors.textDark),
                ),
              ],
            ),
            Image.asset(AppImages.cashIcon, height: AppDimens.h14),
          ],
        ),
      ],
    );
  }

  // Step 5 Driver Offers View
  Widget _buildDriverOffersSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomButton(
          text: 'Cancel request',
          color: AppColors.white,
          textColor: AppColors.primary,
          borderColor: AppColors.primary,
          onPressed: () {
            setState(() {
              _currentStep = PassengerStep.initialOffer;
            });
          },
        ),
        hSpace(AppDimens.h20),
        Row(
          children: [
            Icon(Icons.location_on, color: AppColors.purple),
            wSpace(AppDimens.w8),
            Text(
              'Ain Shams University',
              style: AppStyles.medium16.copyWith(color: AppColors.textDark),
            ),
          ],
        ),
        hSpace(AppDimens.h8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  "EGP",
                  style: AppStyles.bold18.copyWith(color: AppColors.textDark),
                ),

                wSpace(AppDimens.w8),
                Text(
                  '$_offeredFare',
                  style: AppStyles.medium16.copyWith(color: AppColors.textDark),
                ),
              ],
            ),
            Image.asset(AppImages.cashIcon, height: AppDimens.h14),
          ],
        ),
      ],
    );
  }
}
