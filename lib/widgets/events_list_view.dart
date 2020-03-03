import 'dart:async';

import 'package:event_locator/models/event.dart';
import 'package:event_locator/services/events_service.dart';
import 'package:event_locator/widgets/events_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class InfiniteEventsScroll extends StatefulWidget {
  @override
  _InfiniteEventsScrollState createState() => new _InfiniteEventsScrollState();
}

class _InfiniteEventsScrollState extends State<InfiniteEventsScroll> {
  final int _maxSize = 100;

  List<Event> _data = [];
  Future<List<Event>> _future;
  ScrollController _controller =
      ScrollController(initialScrollOffset: 0.0, keepScrollOffset: true);

  _InfiniteEventsScrollState() {
    _controller.addListener(() {
      var isEnd = _controller.offset == _controller.position.maxScrollExtent;
      if (isEnd)
        setState(() {
          _future = loadData();
        });
    });
    _future = loadData();
  }

  ///Mimic load data
  Future<List<Event>> loadData() async {
    if (_data.length < _maxSize) {
      ///Mimic 1 second delay loading of data
      await Future.delayed(Duration(seconds: 1));

      ///Get instance of service
      return _data += GetIt.instance<EventsService>().getEventsList(4);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Event> loaded = snapshot.data;
            return ListView.builder(
              itemCount: loaded.length,
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                if (index <= loaded.length) {
                  return Column(
                    children: <Widget>[
                      EventCard(_data[index]),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
