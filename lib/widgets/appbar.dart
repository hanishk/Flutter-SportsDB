import 'package:flutter/material.dart';
import 'package:sports_db/config/colors.dart';

AppBar mainAppBar(BuildContext context,
        {@required String? title,
        List<Widget>? actions,
        Widget? leading,
        bool automaticallyImplyLeading = true}) =>
    AppBar(
      title: Hero(
        tag: title!,
        child: Material(
          color: Colors.transparent,
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: headlineColor,
            ),
          ),
        ),
      ),
      leading: leading ?? (automaticallyImplyLeading ? null : Container()),
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: redPrimary,
      elevation: 12.0,
      centerTitle: false,
      iconTheme: const IconThemeData(
        // color: Theme.of(context).primaryColor,
        color: headlineColor,
      ),
      actions: actions,
    );
