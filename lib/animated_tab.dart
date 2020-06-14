import 'package:flutter/material.dart';

class AnimatedTab extends StatefulWidget {
  final tabTitle;
  final tabIcon;
  final animate;

  const AnimatedTab({Key key, this.tabTitle, this.tabIcon, this.animate})
      : super(key: key);
  @override
  _AnimatedTabState createState() => _AnimatedTabState();
}

class _AnimatedTabState extends State<AnimatedTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.red,
          width: 36,
          height: 36,
          child: Center(
            child: AnimatedContainer(
              curve: Curves.bounceOut,
              alignment: Alignment.center,
              duration: Duration(milliseconds: 500),
              height: widget.animate ? 32 : 28,
              width: widget.animate ? 32 : 28,
              child: Icon(widget.tabIcon, size: 14, color: Colors.white),
              decoration: BoxDecoration(
                  color: Color(0xff9699F8),
                  boxShadow: !widget.animate
                      ? null
                      : [
                          BoxShadow(
                              spreadRadius: 2.0,
                              blurRadius: 4.0,
                              color: Colors.black38,
                              offset: Offset(4.0, 4.0))
                        ],
                  borderRadius: BorderRadius.circular(
                    widget.animate ? 16 : 14,
                  ),
                  border: Border.all(color: Colors.white, width: 3.0)),
            ),
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          alignment: Alignment.center,
          width: 72,
          height: 16,
          child: Text(
            widget.tabTitle.toUpperCase(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: widget.animate ? FontWeight.bold : null,
            ),
          ),
        )
      ],
    );
  }
}
