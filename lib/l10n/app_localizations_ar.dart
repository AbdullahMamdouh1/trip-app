// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appName => 'تريبو';

  @override
  String get skip => 'تخطي';

  @override
  String get next => 'التالي';

  @override
  String get signUpOrLogIn => 'تسجيل الدخول / إنشاء حساب';

  @override
  String get onboardingTitle1 => 'مرحباً بك في TRIPU';

  @override
  String get onboardingSubtitle1 => 'هل تحتاج إلى رحلة سريعة أو سيارة مع سائق لساعات أو أيام؟ نحن هنا لخدمتك.';

  @override
  String get onboardingTitle2 => 'استأجر سيارات مع سائقين';

  @override
  String get onboardingSubtitle2 => 'استمتع بمهنية استئجار سيارة مع سائق محترف لساعات أو أيام.';

  @override
  String get onboardingTitle3 => 'آمن، موثوق ومريح';

  @override
  String get onboardingSubtitle3 => 'سائقون محترفون، سيارات صيانة ممتازة، وطرق دفع سهلة';

  @override
  String get online => 'متصل';

  @override
  String get offline => 'غير متصل';

  @override
  String acceptFor(int price) {
    return 'قبول بـ $price ج.م';
  }

  @override
  String get offerYourFare => 'قدّم عرضك';

  @override
  String customerOffer(int price) {
    return 'عرض العميل: $price ج.م';
  }

  @override
  String get offer => 'إرسال العرض';

  @override
  String get offeringYourFare => 'جاري تقديم عرضك';

  @override
  String get waitingForReply => 'في انتظار رد العميل';

  @override
  String pickupTime(String time) {
    return 'وقت الوصول للعميل: ~ $time دقيقة';
  }

  @override
  String get swapToStartTrip => 'اسحب لبدء الرحلة';

  @override
  String get rides => 'الرحلات';

  @override
  String get rentByTime => 'الإيجار بالساعة';

  @override
  String get rentByDays => 'الإيجار بالأيام';

  @override
  String get wallet => 'المحفظة';

  @override
  String get tripUCash => 'كاش TripU';

  @override
  String get addFunds => 'إضافة أموال';

  @override
  String get earnedToday => 'أرباح اليوم';

  @override
  String get checkAll => 'عرض الكل';

  @override
  String get transactionHistory => 'سجل المعاملات';

  @override
  String get today => 'اليوم';

  @override
  String get requestsHistory => 'سجل الطلبات';

  @override
  String get settings => 'الإعدادات';

  @override
  String get callSupport => 'الاتصال بالدعم';

  @override
  String get inviteAFriend => 'دعوة صديق';

  @override
  String get signOut => 'تسجيل الخروج';

  @override
  String tripsCount(int count) {
    return '$count رحلة';
  }

  @override
  String get driver => 'سائق';

  @override
  String get passenger => 'راكب';
}
