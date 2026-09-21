import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_app/core/routing/app_router.dart';
import 'package:trip_app/l10n/app_localizations.dart';

class TripApp extends StatefulWidget {
  const TripApp({super.key});

  @override
  State<TripApp> createState() => _TripAppState();
}

class _TripAppState extends State<TripApp> {
  late final GoRouter router;

  @override
  void initState() {
    super.initState();
    router = AppRouter.getRouter();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      ensureScreenSize: true,
      fontSizeResolver: FontSizeResolvers.radius,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,

          routerConfig: router,
        );
      },
    );
  }
}


