import 'package:admin_app/features/auth/presentation/bloc/login_admin/login_admin_bloc.dart';
import 'package:admin_app/singletons/init_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocManager {
  static MultiBlocProvider provider({
    required BuildContext context,
    required Widget child,
  }) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => sl<LoginAdminBloc>()),
      ],
      child: child,
    );
  }
}
