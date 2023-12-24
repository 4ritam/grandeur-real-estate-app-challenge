import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grandeur/features/activities/presentation/pages/activities_page.dart';
import 'package:grandeur/features/listings/presentation/pages/home_page.dart';
import 'package:grandeur/features/messaging/presentation/pages/inbox_page.dart';
import 'package:grandeur/features/profile/presentation/pages/profile_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ViewTemplate extends HookConsumerWidget {
  final int index;
  const ViewTemplate({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState<int>(index);

    void changeIndex(int index) {
      currentIndex.value = index;
    }

    return Scaffold(
      body: IndexedStack(
        index: currentIndex.value,
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
        currentIndex: currentIndex.value,
        onTap: changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex.value == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: currentIndex.value == 1
                ? const Icon(Icons.message)
                : const Icon(Icons.message_outlined),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: currentIndex.value == 2
                ? const Icon(Icons.local_activity)
                : const Icon(Icons.local_activity_outlined),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: currentIndex.value == 3
                ? const Icon(Icons.person)
                : const Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
