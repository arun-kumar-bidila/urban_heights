import 'package:apartment_app/config/routes/app_routes.dart';
import 'package:apartment_app/config/theme/app_colors.dart';
import 'package:apartment_app/features/auth/presentation/bloc/fetch_apartment/fetch_apartment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

class AuthGateway extends StatefulWidget {
  const AuthGateway({super.key});

  @override
  State<AuthGateway> createState() => _AuthGatewayState();
}

class _AuthGatewayState extends State<AuthGateway> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");

    if (token == null || token.isEmpty) {
      if (mounted) {
        context.go(AppRoutes.login);
      }
    }
    if (mounted) {
      context.read<FetchApartmentBloc>().add(FetchApartment());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchApartmentBloc, FetchApartmentState>(
      listener: (context, state) {
        if (state is FetchApartmentFailure) {
          context.go(AppRoutes.login);
        } else if (state is FetchApartmentSuccess) {
          context.go(AppRoutes.dashboard);
        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.stealBlue),
        ),
      ),
    );
  }
}
