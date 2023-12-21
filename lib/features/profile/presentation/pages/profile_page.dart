import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              titlePadding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          const SliverFillRemaining(
            child: Center(
              child: Text('Profile Page'),
            ),
          )
        ],
      ),
    );
  }
}
