import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_db/config/colors.dart';
import 'package:sports_db/controllers/countryLeagueController.dart';
import 'package:sports_db/views/league/leagueTile.dart';
import 'package:sports_db/widgets/appbar.dart';
import 'package:sports_db/widgets/styles.dart';

class LeagueScreen extends StatefulWidget {
  final String countryName;
  const LeagueScreen({required this.countryName});

  @override
  _LeagueScreenState createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  final countryLeagueController = Get.put(CountryLeagueController());

  @override
  void initState() {
    countryLeagueController.getLeagueList(countryName: widget.countryName);
    // countryLeagueController.query.value = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // mainAppBar is common App bar for all of Screens
      appBar: mainAppBar(context, title: widget.countryName),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 14.0),
            child: TextField(
              onChanged: (query) async {
                if (query.length != 0)
                  await countryLeagueController.searchedLeague(
                      countryName: widget.countryName, league: query);
                else
                  await countryLeagueController.getLeagueList(
                      countryName: widget.countryName);
              },
              cursorColor: redPrimary,
              decoration:
                  TfDecoration.inputDecoration(textHint: 'Search leagues...'),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                if (countryLeagueController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else
                  return ListView.builder(
                      itemCount: countryLeagueController.leagueList.length,
                      itemBuilder: (context, index) {
                        String? bgImage = countryLeagueController.getBgImage(
                            countryLeagueController
                                .leagueList[index].strSport!);
                        return LeagueTile(
                          countryLeageModel:
                              countryLeagueController.leagueList[index],
                          bgImage: bgImage!,
                        );
                      });
              },
            ),
          ),
        ],
      ),
    );
  }
}
