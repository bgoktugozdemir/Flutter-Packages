import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const double expandedHeight = 550;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      //! Default Bottom Bar Controller is important!
      home: DefaultBottomBarController(
        dragLength: expandedHeight,
        snap: true,
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // Set to true for bottom appbar overlap body content
      appBar: AppBar(
        title: Text("Expandable Bottom Bar"),
      ),
      body: Center(
        child: Container(
          child: Text("@bgoktugozdemir", style: TextStyle(fontWeight: FontWeight.w800)),
        ),
      ),
      backgroundColor: Theme.of(context).canvasColor,
      // Lets use docked FAB for handling state of sheet
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        // Set onVerticalDrag event to drag handlers of controller for swipe effect
        onVerticalDragUpdate: DefaultBottomBarController.of(context).onDrag,
        onVerticalDragEnd: DefaultBottomBarController.of(context).onDragEnd,
        child: FloatingActionButton.extended(
          label: Text("Pull up"),
          elevation: 2,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          // Set onPressed event to swap state of bottom bar
          onPressed: () => DefaultBottomBarController.of(context).swap(),
        ),
      ),
      // Actual expandable bottom bar
      bottomNavigationBar: BottomExpandableAppBar(
        expandedHeight: expandedHeight,
        horizontalMargin: 16,
        shape: AutomaticNotchedShape(
          RoundedRectangleBorder(),
          StadiumBorder(side: BorderSide()),
        ),
        expandedBackColor: Theme.of(context).backgroundColor,
        expandedBody: Center(
          child: Text("@bgoktugozdemir"),
        ),
        bottomAppBarBody: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Text(
                  "Left",
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Expanded(
                child: Text(
                  "Right",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
