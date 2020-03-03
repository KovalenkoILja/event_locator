import 'package:event_locator/models/event.dart';
import 'package:faker/faker.dart';

class EventsService {
  final List<String> images = [
    'https://images.unsplash.com/photo-1583154683839-2d49400c3d65?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMzMTkxfQ',
    'https://images.unsplash.com/photo-1583142499515-db3e66a57bdc?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMzMTkxfQ',
    'https://images.unsplash.com/photo-1583139691406-5abbe3faf6a3?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMzMTkxfQ',
    'https://images.unsplash.com/photo-1583139795487-98cc0de0ce50?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&ixid=eyJhcHBfaWQiOjMzMTkxfQ',
  ];

  List<Event> getEventsList(int size) {
    List<Event> data = [];

    for (var i = 1; i <= size; i++) {
      data.add(generateEvent());
    }

    return data;
  }

  Event generateEvent() {
    var fakeDate = faker.date.dateTime(minYear: 2019, maxYear: 2021).toLocal();

    return new Event(
        title: faker.company.name(),
        image: images[random.integer(images.length)],
        distance: '~' + random.integer(9, min: 1).toString() + ' км',
        date: "${fakeDate.day.toString()}."
            "${fakeDate.month.toString().padLeft(2, '0')}."
            "${fakeDate.year.toString().padLeft(2, '0')}");
  }
}
