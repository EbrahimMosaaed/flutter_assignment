import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
            color: Colors.white,
            elevation: 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.home,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
                      IconButton(
                  icon: Icon(
                    FontAwesomeIcons.info,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Info');
                  },
                ),
              ],
            ),
          );
  }
}