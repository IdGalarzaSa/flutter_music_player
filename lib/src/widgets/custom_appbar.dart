import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {}, icon: Icon(FontAwesomeIcons.chevronLeft)),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.commentAlt)),
          IconButton(
              onPressed: () {}, icon: Icon(FontAwesomeIcons.headphonesAlt)),
          IconButton(
              onPressed: () {}, icon: Icon(FontAwesomeIcons.externalLinkAlt))
        ],
      ),
    );
  }
}
