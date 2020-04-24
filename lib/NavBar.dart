import 'package:flutter/material.dart';

import 'NavBarItem.dart';

class NavBar extends StatefulWidget {
  final List<NavBarItem> item;
  final List<Widget> screen;

  NavBar({this.item,this.screen});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        widget.screen[selectedIndex],
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(10.0),
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 0.1),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.item
                  .map((t) => NavBarItem(
                        active: (widget.item.indexOf(t) == selectedIndex)
                            ? true
                            : false,
                        color: t.color,
                        text: t.text,
                        icon: t.icon,
                        onPressed: () {
                          setState(() {
                            print(widget.item.indexOf(t));
                            selectedIndex = widget.item.indexOf(t);
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}