import 'package:admin_app/config/routes/app_routes.dart';
import 'package:admin_app/features/auth/domain/use_case/fetch_admin_use_case.dart';
import 'package:admin_app/features/auth/presentation/bloc/fetch_admin/fetch_admin_bloc.dart';
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
      context.read<FetchAdminBloc>().add(
        FetchAdmin(
          fetchAdminUseCaseParams: FetchAdminUseCaseParams(token: token!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchAdminBloc, FetchAdminState>(
      listener: (context, state) {
        if (state is FetchAdminFailure) {
          context.go(AppRoutes.login);
        } else if (state is FetchAdminSuccess) {
          context.go(AppRoutes.dashboard);
        }
      },
      child: Scaffold(body: CircularProgressIndicator()),
    );
  }
}
