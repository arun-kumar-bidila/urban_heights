part of 'fetch_admin_bloc.dart';

sealed class FetchAdminState extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchAdminInitial extends FetchAdminState {}

final class FetchAdminLoading extends FetchAdminState {}

final class FetchAdminFailure extends FetchAdminState {
  final Failure failure;
  FetchAdminFailure({required this.failure});
}

final class FetchAdminSuccess extends FetchAdminState {}
