import 'package:apartment_app/config/routes/app_router_config.dart';
import 'package:apartment_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Apartment',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routerConfig: GoRouterConfig.router,
    );
  }
}
