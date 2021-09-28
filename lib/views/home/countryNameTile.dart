import 'package:flutter/material.dart';
import 'package:sports_db/config/colors.dart';
import 'package:sports_db/views/league/league.dart';

class CountryNameTile extends StatelessWidget {
  final String countryName;
  const CountryNameTile({required this.countryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Go To Second Screen with Country Name
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LeagueScreen(
            countryName: countryName,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
          color: redAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              countryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 16,
              ),
            ),
            const Icon(
              Icons.arrow_forward,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}
