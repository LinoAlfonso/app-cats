
import '../../domain/domain.dart';
import '../infrastructure.dart';

class CatMapper {

  static Cat jsonToEntity(Map<String, dynamic> json) {
    return Cat(
      weightCat: json['weight'] != null ? WeightCatMapper.jsonToEntity(json['weight']) : null,
      id: json['id'],
      name: json['name'],
      vetStreetUrl: json['vetstreet_url'],
      temperament: json['temperament'],
      origin: json['origin'],
      countryCode: json['country_code'],
      description: json['description'],
      lifeSpan: json['life_span'],
      altNames: json['alt_names'],
      adaptability: json['adaptability'],
      affectionLevel: json['affection_level'],
      childFriendly: json['child_friendly'],
      dogFriendly: json['dog_friendly'],
      energyLevel: json['energy_level'],
      grooming: json['grooming'],
      healthIssues: json['health_issues'],
      intelligence: json['intelligence'],
      sheddingLevel: json['shedding_level'],
      socialNeeds: json['social_needs'],
      strangerFriendly: json['stranger_friendly'],
      imageCat: json['image'] != null ? ImageCatMapper.jsonToEntity(json['image']) : null,
    );
  }

}