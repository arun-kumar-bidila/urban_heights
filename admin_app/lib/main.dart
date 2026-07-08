import 'package:admin_app/config/routes/app_router_config.dart';
import 'package:admin_app/config/theme/app_theme.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Admin',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      routerConfig: GoRouterConfig.router,
    );
  }
}
