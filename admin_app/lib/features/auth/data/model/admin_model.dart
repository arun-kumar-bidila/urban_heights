import 'package:admin_app/features/auth/domain/entity/admin_entity.dart';

class AdminModel extends AdminEntity {
  AdminModel({required super.name, required super.email});

  factory AdminModel.fromJson(Map<String, dynamic> json) =>
      AdminModel(name: json["name"], email: json["email"]);
}
