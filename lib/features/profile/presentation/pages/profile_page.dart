import 'package:flutter/material.dart';
import 'package:grandeur/core/widgets/primary_button.dart';
import 'package:grandeur/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.15,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              titlePadding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05),
            ),
          ),
          SliverFillRemaining(
            child: Center(
              child: Column(
                children: [
                  const Text('Profile Page'),
                  PrimaryButton(
                    onPressed: () {
                      ref.read(authControllerProvider.notifier).logout(context);
                    },
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
