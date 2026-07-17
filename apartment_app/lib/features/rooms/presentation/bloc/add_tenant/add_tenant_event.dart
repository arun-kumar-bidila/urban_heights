part of 'add_tenant_bloc.dart';

sealed class AddTenantEvent extends Equatable {
  const AddTenantEvent();

  @override
  List<Object?> get props => [];
}

final class AddTenant extends AddTenantEvent {
  final AddTenantUseCaseParams addTenantUseCaseParams;

  const AddTenant({required this.addTenantUseCaseParams});
}
