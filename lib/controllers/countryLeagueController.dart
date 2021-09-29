import 'package:get/state_manager.dart';
import 'package:sports_db/api/Api.dart';
import 'package:sports_db/models/allSports.dart';
import 'package:sports_db/models/countryLeague.dart';

class CountryLeagueController extends GetxController {
  var leagueList = <Country>[].obs;
  var allSportsList = <Sport>[].obs;
  RxBool isLoading = true.obs;
  var tempList = <Country>[];
  var query = ''.obs;

  Future getLeagueList({required String countryName}) async {
    try {
      isLoading(true);
      var response = await Api.getLeagues(countryName: countryName);

      if (response.length != 0) {
        leagueList.assignAll(response);
      }
      await getAllSports();
    } catch (e) {
      throw e;
    } finally {
      isLoading(false);
    }
  }

// Get League Background Image according to Sports
  String? getBgImage(String strSport) {
    var status = "ImageNotFound";
    for (var i = 0; i < allSportsList.length; i++) {
      if (strSport == allSportsList[i].strSport) {
        return allSportsList[i].strSportThumb;
      } else {}
    }
    if (status == "ImageNotFound") {
      return "ImageNotFound";
    }
  }

  Future getAllSports() async {
    try {
      // isLoading(true);
      var allSportsResponse = await Api.getAllSports();
      if (allSportsResponse.length != 0) {
        allSportsList.assignAll(allSportsResponse);
      }

      isLoading(false);
    } catch (e) {
      throw e;
    } finally {
      isLoading(false);
    }
  }

  Future searchedLeague(
      {required String countryName, required String league}) async {
    isLoading(true);
    var searchedLeague = await Api.getFilterLeague(
      countryName: countryName,
      leagueName: league,
    );
    if (searchedLeague.isNotEmpty) {
      leagueList.assignAll(searchedLeague);
    } else {
      leagueList.assignAll(tempList);
    }
    isLoading(false);
  }
}
