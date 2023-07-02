class CountryCodeModel {
  final String flag;
  final String countryName;
  final String code;

  const CountryCodeModel(
      {required this.flag, required this.countryName, required this.code});

  static List<CountryCodeModel> generatedItem = [
    const CountryCodeModel(
        flag: 'assets/flags/bangladesh.png',
        countryName: 'Bangladesh',
        code: '+880'),
    const CountryCodeModel(
        flag: 'assets/flags/france.png', countryName: 'France', code: '+33'),
    const CountryCodeModel(
        flag: 'assets/flags/germany.png', countryName: 'Germany', code: '+49'),
    const CountryCodeModel(
        flag: 'assets/flags/india.png', countryName: 'India', code: '+91'),
    const CountryCodeModel(
        flag: 'assets/flags/turkey.png', countryName: 'Turkey', code: '+90'),
    const CountryCodeModel(
        flag: 'assets/flags/united-kingdom.png',
        countryName: 'United Kingdom',
        code: '+44'),
    const CountryCodeModel(
        flag: 'assets/flags/united-states.png',
        countryName: 'United States',
        code: '+1'),
  ];
}
