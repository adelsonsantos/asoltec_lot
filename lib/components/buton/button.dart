// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonIcon extends StatelessWidget {
  double delay;
  Widget icon;
  Widget text;
  String route;
  Color color;

  ButtonIcon(
      {super.key,
      required this.delay,
      required this.icon,
      required this.text,
      required this.route,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: new GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: new Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: FractionalOffset.centerLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        color,
                        const Color.fromARGB(255, 237, 237, 237),
                      ])),
              child: Card(
                child: ListTile(
                  leading: icon,
                  title: text,
                ),
              ))),
    );
  }
}
