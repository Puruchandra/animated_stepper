import 'package:flutter/material.dart';

import 'animated_tab.dart';

enum tabState { active, disabled, done }

class MyPageView extends StatefulWidget {
  MyPageView({Key key}) : super(key: key);

  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  PageController _controller;
  bool isComplete = false;
  double containerWidth = 0.0;
  int index = 0;
  int pageIndex = 0;

  @override
  initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xff9699F8),
        appBar: AppBar(
          title: Text("PageView"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedTab(
                    animate: 0 == index,
                    tabIcon: 0 == index ? null : Icons.check,
                    tabTitle: "Billing",
                  ),
                  Expanded(
                    child: Column(children: [
                      index < 1
                          ? Container(height: 1, color: Colors.white)
                          : Container(height: 3, color: Colors.white),
                      SizedBox(
                        height: 24.0,
                      )
                    ]),
                  ),
                  AnimatedTab(
                    animate: 1 == index,
                    tabIcon: 1 == index ? null : Icons.check,
                    tabTitle: "Review",
                  ),
                  Expanded(
                    child: Column(children: [
                      index < 2
                          ? Container(height: 1, color: Colors.white)
                          : Container(height: 3, color: Colors.white),
                      SizedBox(
                        height: 24.0,
                      )
                    ]),
                  ),
                  AnimatedTab(
                    animate: 2 == index,
                    tabIcon: 2 == index ? null : Icons.check,
                    tabTitle: "Payment",
                  ),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                height: 100,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                    // print(_controller.offset);
                  },
                  controller: _controller,
                  children: <Widget>[
                    Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.redAccent),
                    Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.greenAccent),
                    Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.blueAccent),
                  ],
                ),
              ),
              RaisedButton(
                child: Text("Next"),
                onPressed: () {
                  setState(
                    () {
                      updateIndex();
                      setState(() {});
                      _controller.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linearToEaseOut);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  updateIndex() {
    setState(() {
      index += 1;
    });
  }
}
