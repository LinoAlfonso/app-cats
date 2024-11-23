import 'image_cat.dart';
import 'weight_cat.dart';

class Cat {
  WeightCat? weightCat;
  String? id;
  String? name;
  String? vetStreetUrl;
  String? temperament;
  String? origin;
  String? countryCode;
  String? description;
  String? lifeSpan;
  String? altNames;
  int? adaptability;
  int? affectionLevel;
  int? childFriendly;
  int? dogFriendly;
  int? energyLevel;
  int? grooming;
  int? healthIssues;
  int? intelligence;
  int? sheddingLevel;
  int? socialNeeds;
  int? strangerFriendly;
  ImageCat? imageCat;

  Cat({
    this.weightCat,
    this.id,
    this.name,
    this.vetStreetUrl,
    this.temperament,
    this.origin,
    this.countryCode,
    this.description,
    this.lifeSpan,
    this.altNames,
    this.adaptability,
    this.affectionLevel,
    this.childFriendly,
    this.dogFriendly,
    this.energyLevel,
    this.grooming,
    this.healthIssues,
    this.intelligence,
    this.sheddingLevel,
    this.socialNeeds,
    this.strangerFriendly,
    this.imageCat,
  });

  get lifeSpanInYears => "${lifeSpan ?? ''} years";

}