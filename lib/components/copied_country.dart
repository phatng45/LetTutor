import 'package:flutter_country/models/country.dart';
import 'package:flutter_country/countries_data.dart';
import 'package:flutter_country/models/country_list.dart';
import 'package:flutter_country/models/timezone.dart';
import 'package:collection/collection.dart';

class Countries {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Countries._();
  static CountryList? _countriesList;

  static final CountryList _countryData = _getCountries();

  static CountryList _getCountries() =>
      _countriesList ?? CountryList.fromJson(countriesData);

  /// getting all the countries as a List of [Country]
  static List<Country> all() {
    return _countryData.countries;
  }
  /// get country by Name Example:
  static Country byName(String name) {
    Country country = _countryData.countries.where((c) => c.name == name).first;
    return country;
  }

  static Country byCode(String code) {
    Country country =
        _countryData.countries.where((c) => c.alpha2Code == code).first;
    return country;
  }

  static Country byAlpha3Code(String code) {
    Country country =
        _countryData.countries.where((c) => c.alpha3Code == code).first;
    return country;
  }

  static Country byNumericCode(String code) {
    Country country =
        _countryData.countries.where((c) => c.numericCode == code).first;
    return country;
  }

  static Country byCodeOrName(String code, String name) {
    Country country =
        _countryData.countries.where((c) => c.alpha2Code == code).firstOrNull ??
            _countryData.countries.where((c) => c.nativeName?.replaceAll('-', ' ') == name).firstOrNull ??
            _countryData.countries.first;
    return country;
  }

  static Country byCallingCode(String code) {
    Country country = _countryData.countries.where((c) => c.callingCodes!.contains(code))
        .first;
    return country;
  }

  static Country byCapital(String capital) {
    Country country =
        _countryData.countries.where((c) => c.capital!.contains(capital)).first;
    return country;
  }

  static Country byFlag(String flag) {
    Country country =
        _countryData.countries.where((c) => c.flagIcon == flag).first;
    return country;
  }

  // static List<Country> byLanguageCode(String language) {
  //   List<Country> countries = _countryData.countries
  //       .where((c) => c.languages.containsKey(language))
  //       .toList();
  //   return countries;
  // }

  // static List<Country> byLanguageName(String language) {
  //   List<Country> countries = _countryData.countries
  //       .where((c) => c.languages.containsValue(language))
  //       .toList();
  //   return countries;
  // }

  static List<Country> unMembers() {
    List<Country> countries =
    _countryData.countries.where((c) => c.unMember == true).toList();
    return countries;
  }

  static List<Country> independent() {
    List<Country> countries =
    _countryData.countries.where((c) => c.independent == true).toList();
    return countries;
  }

  static List<Country> byRegion(String region) {
    List<Country> countries =
    _countryData.countries.where((c) => c.region!.contains(region)).toList();
    return countries;
  }

  static Country byArea(double area) {
    Country countries =
        _countryData.countries.where((c) => c.area == area).first;
    return countries;
  }

  static List<Country> areaBiggerThan(double area) {
    List<Country> countries = _countryData.countries.where((c) => c.area != null && c.area! > area)
        .toList();
    return countries;
  }

  static CountryList areaSmallerThan(double area) {
    List<Country> countries = _countryData.countries.where((c) => c.area != null && c.area! < area)
        .toList();
    return CountryList(countries: countries);
  }

  static CountryList byTimeZone(TimeZone timeZone) {
    List<Country> countries = _countryData.countries.where((c) => c.timeZones!.timeZones == null
        ? false
        : c.timeZones!.timeZones!.contains(timeZone))
        .toList();
    return CountryList(countries: countries);
  }
}
