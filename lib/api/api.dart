import 'dart:convert';
import 'package:sports_db/api/url.dart';
import 'package:sports_db/models/allSports.dart';
import 'package:sports_db/models/countryLeague.dart';
import 'package:http/http.dart' as http;

class Api {
  static var _client = http.Client();

  // GET League according to  Country Name
  static Future<List<Country>> getLeagues({required String countryName}) async {
    CountryLeague countryLeague;
    var response =
        await _client.get(Uri.parse(Url.filterLeagueByCountry + countryName));
    print(response.body);
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        countryLeague = CountryLeague.fromJson(userMap);
        return countryLeague.countrys!;
      }
    } catch (e) {
      throw e;
    }
    return [];
  }

  // GET All Sports Images by StrSport
  static Future<List<Sport>> getAllSports() async {
    AllSports allSports;
    var response = await _client.get(Uri.parse(Url.allSports));
    print(response.body);
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        allSports = AllSports.fromJson(userMap);
        return allSports.sports!;
      }
    } catch (e) {
      throw e;
    }
    return [];
  }

  // Search League
  static Future<List<Country>> getFilterLeague({
    required String countryName,
    required String leagueName,
  }) async {
    CountryLeague countryLeague;
    var response = await _client
        .get(Uri.parse(Url.searchFilterLeague + "$countryName&s=$leagueName"));
    print(response.body);
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> userMap = jsonDecode(response.body);
        countryLeague = CountryLeague.fromJson(userMap);
        return countryLeague.countrys!;
      }
    } catch (e) {
      throw e;
    }
    return [];
  }
}
