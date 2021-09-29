import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sports_db/config/colors.dart';
import 'package:sports_db/models/countryLeague.dart';

class LeagueTile extends StatefulWidget {
  final Country countryLeageModel;
  final String bgImage;

  const LeagueTile(
      {required this.countryLeageModel, required this.bgImage, Key? key})
      : super(key: key);

  @override
  _LeagueTileState createState() => _LeagueTileState();
}

class _LeagueTileState extends State<LeagueTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Image.network(
            widget.bgImage,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Positioned(
            left: 12,
            top: 10,
            child: Container(
              width: 300,
              child: Text(
                widget.countryLeageModel.strLeague!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: headlineColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 12,
            child: Row(
              children: [
                widget.countryLeageModel.strTwitter != null
                    ? SvgPicture.asset(
                        "assets/icons/twitter.svg",
                        color: headlineColor,
                        height: 40,
                      )
                    : Container(),
                const SizedBox(width: 12),
                widget.countryLeageModel.strFacebook != null
                    ? SvgPicture.asset(
                        "assets/icons/facebook.svg",
                        color: headlineColor,
                        height: 40,
                      )
                    : Container(),
              ],
            ),
          ),
          Positioned(
            right: 15,
            bottom: 40,
            child: widget.countryLeageModel.strLogo != null
                ? Image.network(
                    widget.countryLeageModel.strLogo.toString(),
                    fit: BoxFit.cover,
                    height: 40,
                  )
                : Container(),
          ),
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
    );
  }
}
