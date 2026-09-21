import 'package:flutter/material.dart';
import 'package:trip_app/features/drawer/view/widgets/custom_drawer.dart';
import 'package:trip_app/features/passenger_home/view/widgets/passenger_home_view_body.dart';

class PassengerHomeView extends StatelessWidget {
  const PassengerHomeView({super.key});

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

      body: PassengerHomeViewBody(),
    );
  }
}
