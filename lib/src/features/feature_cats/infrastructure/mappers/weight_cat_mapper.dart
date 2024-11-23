import '../../domain/domain.dart';

class WeightCatMapper {
  static WeightCat jsonToEntity(Map<String, dynamic> json) {
    return WeightCat(
      imperial: json['imperial'],
      metric: json['metric'],
    );
  }
}