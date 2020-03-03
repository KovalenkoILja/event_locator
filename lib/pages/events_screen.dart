import 'package:event_locator/pages/add_new_event.dart';
import 'package:event_locator/pages/all_events.dart';
import 'package:event_locator/pages/profile.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatefulWidget {
  EventsScreen({Key key, this.title, items}) : super(key: key);

  final String title;

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new PageView(
        children: [
          new AddNewEvent(),
          new AllEvents(),
          new Profile(),
        ],
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
        child: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _page,
          onTap: navigationTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.restore),
                title: Text(
                  'Добавить',
                  //style: TextStyle(color: Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                title: Text(
                  'Все события',
                  //style: TextStyle(color: Colors.grey),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_location),
                title: Text(
                  'Профиль',
                  //style: TextStyle(color: Colors.grey),
                )),
          ],
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.white,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
