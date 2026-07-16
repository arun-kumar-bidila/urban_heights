import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_announcement_event.dart';
part 'delete_announcement_state.dart';

class DeleteAnnouncementBloc extends Bloc<DeleteAnnouncementEvent, DeleteAnnouncementState> {
  DeleteAnnouncementBloc() : super(DeleteAnnouncementInitial()) {
    on<DeleteAnnouncementEvent>((event, emit) {});
  }
}
