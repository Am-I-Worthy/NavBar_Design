import 'package:flutter/material.dart';

class NavBarItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final int n;
  final bool active;
  final Color color;
  final Function onPressed;

  NavBarItem(
      {this.icon, this.text, this.n, this.active, this.color, this.onPressed});

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 375));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut,reverseCurve: Curves.easeIn);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    if(widget.active){
      _controller.forward();
    }
    else{
      _controller.reverse();
    }

    return GestureDetector(
      onTap: () {
        widget.onPressed();
      },
      child:Container(
        decoration: BoxDecoration(
          color: (widget.active) ? widget.color.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(30.0),
        ),
        height: 50.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                widget.icon,
                color: (widget.active) ? widget.color : Colors.black,
              ),
              SizedBox(width: 2.0,),
              AnimatedOpacity(
                duration: Duration(milliseconds: 375),
                opacity: (widget.active) ? 1 : 0,
                curve: Curves.easeOut,
                child: SizeTransition(
                  sizeFactor: _animation,
                  axis: Axis.horizontal,
                  axisAlignment: 1.0,
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: (widget.active)
                        ? (widget.text.length * 12).toDouble()
                        : 0.0,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        widget.text,
                        style: TextStyle(fontSize: 16.0, color: widget.color),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}