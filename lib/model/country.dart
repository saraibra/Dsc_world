class Country {
  final String key;
  final String name;
  final String native;
  final String phone;
  final String continent;
  final String capital;
  final String currency;
  final List<dynamic> languages;
  final bool isFavourited;

  Country(
      {this.isFavourited = false,
      required this.key,
      required this.name,
      required this.native,
      required this.phone,
      required this.continent,
      required this.capital,
      required this.currency,
      required this.languages});
}
