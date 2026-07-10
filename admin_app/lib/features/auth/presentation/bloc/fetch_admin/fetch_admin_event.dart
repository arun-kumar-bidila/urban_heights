part of 'fetch_admin_bloc.dart';

sealed class FetchAdminEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchAdmin extends FetchAdminEvent {}

final class ResetAdminBlocEvent extends FetchAdminEvent {}
