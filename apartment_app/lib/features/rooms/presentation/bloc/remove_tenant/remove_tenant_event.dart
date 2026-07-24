part of 'remove_tenant_bloc.dart';

sealed class RemoveTenantEvent extends Equatable {
  const RemoveTenantEvent();

  @override
  List<Object?> get props => [];
}

final class RemoveTenant extends RemoveTenantEvent {
  final RemoveTenantUseCaseParams params;

  const RemoveTenant({required this.params});
}
