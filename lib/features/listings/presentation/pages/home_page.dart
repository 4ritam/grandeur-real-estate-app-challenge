import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grandeur/core/widgets/circular_action_button.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/widgets/search_field.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: CustomScrollView(
        physics: const PageScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.125,
            title: SearchField(controller: searchController),
            actions: [
              CircularActionButton(
                child: const Icon(Icons.filter_list),
                onPressed: () {
                  context.pushNamed(Routes.filterPage);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
