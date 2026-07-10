import 'package:admin_app/features/dashboard/domain/entity/summary_entity.dart';

class SummaryModel extends SummaryEntity {
  SummaryModel({required super.totalApartments, required super.totalOwners});

  factory SummaryModel.fromJson(Map<String, dynamic> json) => SummaryModel(
    totalApartments: json["totalApartments"],
    totalOwners: json["totalOwners"],
  );
}
