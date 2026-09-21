import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_app/core/localization/localization_extension.dart';
import 'package:trip_app/core/routing/routes.dart';
import 'package:trip_app/core/shared/custom_button.dart';
import 'package:trip_app/core/utils/app_dimens.dart';

class RoleSelectionViewBody extends StatelessWidget {
  const RoleSelectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppDimens.r16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(
            onPressed: () {
              context.push(Routes.driverHomeView);
            },
            text: context.l10n.driver,
          ),
          hSpace(AppDimens.h16),
          CustomButton(
            onPressed: () {
              context.push(Routes.passengerHomeView);
            },
            text: context.l10n.passenger,
          ),
        ],
      ),
    );
  }
}
