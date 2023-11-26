import 'package:flutter/material.dart';
import 'package:rsao/utils/routes/routes_name.dart';
import 'package:rsao/views/login_screen.dart';
// import 'package:ride_sharing_users/mainScreens/about_screen.dart';
// import 'package:ride_sharing_users/mainScreens/main_screen.dart';
// import 'package:ride_sharing_users/mainScreens/profile_screen.dart';
// import 'package:ride_sharing_users/mainScreens/search_places_screen.dart';
// import 'package:ride_sharing_users/mainScreens/trips_history_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //auth screen routes
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());

      //drawer screen routes
      // case RoutesName.home:
      //   return MaterialPageRoute(builder: (BuildContext context) => const HomeTabPage());
      // case RoutesName.ratings:
      //   return MaterialPageRoute(builder: (BuildContext context) => const RatingsTabPage());
      // case RoutesName.earning:
      //   return MaterialPageRoute(builder: (BuildContext context) => const EarningsTabPage());
      // case RoutesName.profile:
      //   return MaterialPageRoute(builder: (BuildContext context) => const ProfileTabPage());

      //main screen routes
      // case RoutesName.main:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const MainScreen());
      // case RoutesName.searchPlaces:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const SearchPlacesScreen());
      // case RoutesName.history:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const TripsHistoryScreen());
      // case RoutesName.profileScreen:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const ProfileScreen());
      // case RoutesName.about:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const AboutScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
