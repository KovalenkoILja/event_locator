import 'package:event_locator/widgets/events_header.dart';
import 'package:event_locator/widgets/events_list_view.dart';
import 'package:flutter/material.dart';

class AllEvents extends StatefulWidget {
  @override
  _AllEventsState createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  String listType = 'All Events Screen';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 0.0),
              child: Column(
                children: <Widget>[
                  EventsHeader(),
                ],
              ),
            ),
          ),
          Expanded(
            child: InfiniteEventsScroll(),
          ),
        ],
      ),
    );
  }
}
