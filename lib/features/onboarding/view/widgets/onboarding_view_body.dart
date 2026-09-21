import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_app/core/localization/localization_extension.dart';
import 'package:trip_app/core/routing/routes.dart';
import 'package:trip_app/core/shared/custom_button.dart';

import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_images.dart';
import 'package:trip_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:trip_app/features/onboarding/view/widgets/onboarding_header.dart';
import 'package:trip_app/features/onboarding/view/widgets/onboarding_page_indicator.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed(int totalPages) {
    if (_currentIndex < totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.push(Routes.roleSelectionView);
    }
  }

  void _onSkipPressed() {
    context.push(Routes.roleSelectionView);
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> items = [
      OnboardingModel(
        image: AppImages.onboarding1,
        title: context.l10n.onboardingTitle1,
        subtitle: context.l10n.onboardingSubtitle1,
      ),
      OnboardingModel(
        image: AppImages.onboarding2,
        title: context.l10n.onboardingTitle2,
        subtitle: context.l10n.onboardingSubtitle2,
      ),
      OnboardingModel(
        image: AppImages.onboarding3,
        title: context.l10n.onboardingTitle3,
        subtitle: context.l10n.onboardingSubtitle3,
      ),
    ];

    final bool isLastPage = _currentIndex == items.length - 1;

    return SafeArea(
      child: Column(
        children: [
          hSpace(AppDimens.h16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
            child: OnboardingHeader(
              isLastPage: isLastPage,
              title: items[_currentIndex].title,
              subtitle: items[_currentIndex].subtitle,
              onSkipTap: _onSkipPressed,
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: items.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: AppDimens.h20),
                  child: Image.asset(items[index].image, fit: BoxFit.contain),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.defaultPadding),
            child: Padding(
              padding: EdgeInsets.only(bottom: AppDimens.h24),
              child: isLastPage
                  ? CustomButton(
                      onPressed: () => _onNextPressed(items.length),
                      text: context.l10n.signUpOrLogIn,
                      textColor: AppColors.textDark,
                      width: double.infinity,
                      color: AppColors.white,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OnboardingPageIndicator(
                          count: items.length,
                          currentIndex: _currentIndex,
                        ),
                        CustomButton(
                          onPressed: () => _onNextPressed(items.length),
                          text: context.l10n.next,
                          textColor: AppColors.textDark,
                          width: 80.w,
                          color: AppColors.white,
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
