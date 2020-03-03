import 'package:event_locator/models/event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final Event event;

  EventCard(this.event);

  @override
  State<StatefulWidget> createState() {
    return EventCardState(event);
  }
}

class EventCardState extends State<EventCard> {
  Event event;
  String renderUrl;

  EventCardState(this.event);

  Widget get cardItem {
    return new Card(
      elevation: 5,
      margin: EdgeInsets.fromLTRB(14.0, 12.0, 14.0, 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: InkWell(
        onTap: () {
          print('Tap on ' + event.title);
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(event.image),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            event.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 6,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 0.0),
                          child: Text(
                            event.date,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Icon(
                          Icons.location_on,
                          size: 26.0,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          event.distance,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Theme.of(context).accentColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: cardItem,
    );
  }
}
