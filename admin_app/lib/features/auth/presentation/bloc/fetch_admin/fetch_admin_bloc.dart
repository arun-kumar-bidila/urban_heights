import 'package:admin_app/core/failure.dart';
import 'package:admin_app/features/auth/domain/use_case/fetch_admin_use_case.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_admin_event.dart';
part 'fetch_admin_state.dart';

class FetchAdminBloc extends Bloc<FetchAdminEvent, FetchAdminState> {
  FetchAdminBloc() : super(FetchAdminInitial()) {
    on<FetchAdminEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
