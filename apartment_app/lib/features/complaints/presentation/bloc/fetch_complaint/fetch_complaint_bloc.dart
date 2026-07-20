import 'package:apartment_app/core/failure.dart';
import 'package:apartment_app/core/use_case.dart';
import 'package:apartment_app/features/complaints/domain/entity/complaint_entity.dart';
import 'package:apartment_app/features/complaints/domain/use_case/fetch_complaints_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'fetch_complaint_event.dart';
part 'fetch_complaint_state.dart';

class FetchComplaintBloc
    extends Bloc<FetchComplaintEvent, FetchComplaintState> {
  final FetchComplaintsUseCase fetchComplaintsUseCase;
  FetchComplaintBloc({required this.fetchComplaintsUseCase})
    : super(FetchComplaintInitial()) {
    on<FetchComplaint>(fetchComplaints);
  }

  void fetchComplaints(
    FetchComplaint event,
    Emitter<FetchComplaintState> emit,
  ) async {
    emit(FetchComplaintLoading());
    try {
      final response = await fetchComplaintsUseCase(NoParams());

      response.fold(
        (failure) => emit(FetchComplaintFailure(failure: failure)),
        (success) => emit(FetchComplaintSuccess(complaints: success)),
      );
    } catch (e) {
      emit(FetchComplaintFailure(failure: Failure()));
    }
  }
}
