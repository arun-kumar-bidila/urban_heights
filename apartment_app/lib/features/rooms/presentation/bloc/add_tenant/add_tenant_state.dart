part of 'add_tenant_bloc.dart';

sealed class AddTenantState extends Equatable {
  const AddTenantState();

  @override
  List<Object?> get props => [];
}

final class AddTenantInitial extends AddTenantState {}

final class AddTenantLoading extends AddTenantState {}

final class AddTenantFailure extends AddTenantState {
  final Failure failure;

  const AddTenantFailure({required this.failure});
}

final class AddTenantSuccess extends AddTenantState {}
