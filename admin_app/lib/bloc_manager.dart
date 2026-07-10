import 'package:admin_app/features/apartment/presentation/bloc/add_apartment/add_apartment_bloc.dart';
import 'package:admin_app/features/auth/presentation/bloc/fetch_admin/fetch_admin_bloc.dart';
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
        /* ***************************  ADMIN ************************/
        BlocProvider(create: (BuildContext context) => sl<LoginAdminBloc>()),
        BlocProvider(create: (BuildContext context) => sl<FetchAdminBloc>()),

        /* ***************************  APARTMENT ************************/
        BlocProvider(create: (BuildContext context) => sl<AddApartmentBloc>()),
      ],
      child: child,
    );
  }
}
