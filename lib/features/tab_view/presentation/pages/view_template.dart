import 'package:flutter/material.dart';
import 'package:grandeur/features/activities/presentation/pages/activities_page.dart';
import 'package:grandeur/features/listings/presentation/pages/home_page.dart';
import 'package:grandeur/features/messaging/presentation/pages/inbox_page.dart';
import 'package:grandeur/features/profile/presentation/pages/profile_page.dart';

class ViewTemplate extends StatefulWidget {
  final int index;
  const ViewTemplate({
    super.key,
    required this.index,
  });

  @override
  State<ViewTemplate> createState() => _ViewTemplateState();
}

class _ViewTemplateState extends State<ViewTemplate> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomePage(),
          const InboxPage(),
          const ActivitiesPage(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
        ),
        currentIndex: currentIndex,
        onTap: changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 1
                ? const Icon(Icons.message)
                : const Icon(Icons.message_outlined),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 2
                ? const Icon(Icons.local_activity)
                : const Icon(Icons.local_activity_outlined),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: currentIndex == 3
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
