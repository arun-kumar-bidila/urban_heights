import 'package:apartment_app/features/auth/presentation/bloc/fetch_apartment/fetch_apartment_bloc.dart';
import 'package:apartment_app/features/auth/presentation/bloc/login_apartment/login_apartment_bloc.dart';
import 'package:apartment_app/singletons/init_dependencies.dart';
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
        BlocProvider(
          create: (BuildContext context) => sl<LoginApartmentBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) => sl<FetchApartmentBloc>(),
        ),

        /* ***************************  APARTMENT ************************/
        // BlocProvider(create: (BuildContext context) => sl<AddApartmentBloc>()),
        // BlocProvider(
        //   create: (BuildContext context) => sl<DashboardSummaryBloc>(),
        // ),
        // BlocProvider(
        //   create: (BuildContext context) => sl<FetchAllApartmentsBloc>(),
        // ),
      ],
      child: child,
    );
  }
}
