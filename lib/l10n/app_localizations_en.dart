// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'TRIPU';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get signUpOrLogIn => 'Sign Up / Log In';

  @override
  String get onboardingTitle1 => 'Welcome to TRIPU';

  @override
  String get onboardingSubtitle1 => 'Need a quick ride or a car with a driver for hours or days? We’ve got you covered.';

  @override
  String get onboardingTitle2 => 'Rent Cars with Drivers';

  @override
  String get onboardingSubtitle2 => 'Enjoy the convenience of renting a car with a professional driver for hours or days.';

  @override
  String get onboardingTitle3 => 'Safe, Reliable, and Convenient';

  @override
  String get onboardingSubtitle3 => 'Professional Drivers, Well-Maintained Cars and Easy Payments';

  @override
  String get online => 'Online';

  @override
  String get offline => 'Offline';

  @override
  String acceptFor(int price) {
    return 'Accept for $price EGP';
  }

  @override
  String get offerYourFare => 'Offer your fare';

  @override
  String customerOffer(int price) {
    return 'Customer\'s offer: EGP$price';
  }

  @override
  String get offer => 'Offer';

  @override
  String get offeringYourFare => 'Offering your fare';

  @override
  String get waitingForReply => 'Waiting for the replay';

  @override
  String pickupTime(String time) {
    return 'Pickup time: ~ $time min.';
  }

  @override
  String get swapToStartTrip => 'Swap to start your trip';

  @override
  String get rides => 'Rides';

  @override
  String get rentByTime => 'Rent by time';

  @override
  String get rentByDays => 'Rent by days';

  @override
  String get wallet => 'Wallet';

  @override
  String get tripUCash => 'TripU Cash';

  @override
  String get addFunds => 'Add Funds';

  @override
  String get earnedToday => 'EARNED TODAY';

  @override
  String get checkAll => 'Check all';

  @override
  String get transactionHistory => 'Transaction History';

  @override
  String get today => 'Today';

  @override
  String get requestsHistory => 'Requests history';

  @override
  String get settings => 'Settings';

  @override
  String get callSupport => 'Call Support';

  @override
  String get inviteAFriend => 'Invite a Friend';

  @override
  String get signOut => 'Sign Out';

  @override
  String tripsCount(int count) {
    return '$count Trip';
  }

  @override
  String get driver => 'Driver';

  @override
  String get passenger => 'Passenger';
}
