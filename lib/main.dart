import 'package:event_locator/pages/events_screen.dart';
import 'package:event_locator/shared/locator.dart';
import 'package:event_locator/shared/theme.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true;
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  setupLocator();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Event Locator',
      theme: getThemeData(context),
      debugShowCheckedModeBanner: false,
      home: new EventsScreen(title: 'Events'),
    );
  }
}
