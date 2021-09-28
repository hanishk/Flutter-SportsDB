import 'package:flutter/material.dart';
import 'package:sports_db/config/colors.dart';
import 'package:sports_db/views/home/countryNameTile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: redPrimary,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            const Text(
              "The Sports DB",
              style: TextStyle(
                color: headlineColor,
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            CountryNameTile(countryName: 'India'),
            CountryNameTile(countryName: 'United States'),
            CountryNameTile(countryName: 'Australia'),
            CountryNameTile(countryName: 'China'),
            CountryNameTile(countryName: 'Argentina'),
            CountryNameTile(countryName: 'Canada'),
          ],
        ),
      ),
    );
  }
}
