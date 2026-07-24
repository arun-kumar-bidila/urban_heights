part of 'remove_tenant_bloc.dart';

sealed class RemoveTenantState extends Equatable {
  const RemoveTenantState();

  @override
  List<Object?> get props => [];
}

final class RemoveTenantInitial extends RemoveTenantState {}

final class RemoveTenantLoading extends RemoveTenantState {}

final class RemoveTenantFailure extends RemoveTenantState {
  final Failure failure;

  const RemoveTenantFailure({required this.failure});
}

final class RemoveTenantSuccess extends RemoveTenantState {}
