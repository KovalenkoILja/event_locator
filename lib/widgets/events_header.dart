import 'package:flutter/material.dart';

class MenuItems {
  static const String FirstItem = 'First Item';
  static const String SecondItem = 'Second Item';
  static const String ThirdItem = 'Third Item';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
  ];
}

void choiceAction(String choice) {
  if (choice == MenuItems.FirstItem) {
    print('I First Item');
  } else if (choice == MenuItems.SecondItem) {
    print('I Second Item');
  } else if (choice == MenuItems.ThirdItem) {
    print('I Third Item');
  }
}

class EventsHeader extends StatefulWidget {
  const EventsHeader({
    Key key,
  }) : super(key: key);

  @override
  _EventsHeaderState createState() => _EventsHeaderState();
}

class _EventsHeaderState extends State<EventsHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, top: 14.0),
              child: Text(
                'Все события',
                style: TextStyle(
                    fontSize: 22.0, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: PopupMenuButton(
              onSelected: choiceAction,
              icon: Icon(Icons.filter_list,
                  size: 26.0, color: Theme.of(context).primaryColor),
              itemBuilder: (BuildContext context) {
                return MenuItems.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ],
    );
  }
}
