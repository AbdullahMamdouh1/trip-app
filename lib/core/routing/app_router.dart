import 'package:go_router/go_router.dart';
import 'package:trip_app/core/routing/routes.dart';
import 'package:trip_app/features/auth/view/role_selection_view.dart';
import 'package:trip_app/features/driver_home/view/driver_home_view.dart';
import 'package:trip_app/features/onboarding/view/onboarding_view.dart';
import 'package:trip_app/features/passenger_home/view/passenger_home_view.dart';
import 'package:trip_app/features/wallet/view/wallet_view.dart';

class AppRouter {
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: Routes.onboardingView,

      routes: [
        GoRoute(
          path: Routes.onboardingView,
          builder: (context, state) => const OnboardingView(),
        ),
        GoRoute(
          path: Routes.passengerHomeView,
          builder: (context, state) => const PassengerHomeView(),
        ),
        GoRoute(
          path: Routes.driverHomeView,
          builder: (context, state) => const DriverHomeView(),
        ),
        GoRoute(
          path: Routes.walletView,
          builder: (context, state) => const WalletView(),
        ),
        GoRoute(
          path: Routes.roleSelectionView,
          builder: (context, state) => const RoleSelectionView(),
        ),
      ],
    );
  }
}
