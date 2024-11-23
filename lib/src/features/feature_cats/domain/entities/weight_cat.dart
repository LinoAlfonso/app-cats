class WeightCat{
  String? imperial;
  String? metric;

  WeightCat({
    this.imperial,
    this.metric,
  });

  get weightInLbs => "${imperial ?? ''} lbs";

  get weightInKg => "${metric ?? ''} kg";

}