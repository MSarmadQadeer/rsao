import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rsao/firebase_options.dart';
import 'package:rsao/services/auth_service.dart';
import 'package:rsao/utils/routes/routes.dart';
import 'package:rsao/utils/routes/routes_name.dart';
import 'package:rsao/viewmodels/login_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => AuthService()),
        // Provider(create: (_) => FirebaseService()),
        // Provider(create: (_) => GeoFireService()),
        // Provider(create: (_) => MapService()),
        // Provider(create: (_) => NotificationService()),
        // Provider(create: (_) => RideService()),
        // Provider(create: (_) => UserService()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        // ChangeNotifierProvider(create: (_) => RideViewModel()),
        // ChangeNotifierProvider(
        //   create: (context) => UserViewModel(context.read<UserService>())
        //     ..readCurrentOnlineUserInfo(),
        // ),
        // ChangeNotifierProvider(create: (_) => AppInfo()),
      ],
      child: Consumer<AuthService>(
        builder: (context, authService, _) {
          String initialRoute =
              authService.isAuthenticated ? RoutesName.main : RoutesName.login;
          return MaterialApp(
            title: 'RSAO User',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: initialRoute,
            onGenerateRoute: Routes.generateRoute,
          );
        },
      ),
    );
  }
}
