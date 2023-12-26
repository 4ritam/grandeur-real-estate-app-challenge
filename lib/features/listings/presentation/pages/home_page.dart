import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grandeur/core/widgets/circular_action_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/routes/routes.dart';
import '../../../../core/widgets/search_field.dart';
import '../controller/post_controller.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final posts = ref.watch(postsProvider(context));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.125,
            title: SearchField(controller: searchController),
            actions: [
              CircularActionButton(
                child: const Icon(Icons.filter_list, size: 32),
                onPressed: () {
                  context.pushNamed(Routes.filterPage);
                },
              ),
            ],
          ),
          posts.when(
            data: (data) {
              return SliverList.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        Routes.productDetail,
                        pathParameters: {
                          'id': data[index].id.toString(),
                        },
                        extra: data[index],
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 3.0,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        height: 200,
                        child: Stack(
                          children: [
                            Hero(
                              tag: data[index].images[0],
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                      data[index].images[0],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  data[index].title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 20.0,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 50.0,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                      Shadow(
                                        color: Colors.black,
                                        blurRadius: 100.0,
                                        offset: Offset(1.0, 1.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: data.length,
              );
            },
            error: (error, stackTrace) {
              return SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Text(
                      error.toString(),
                    ),
                  ],
                ),
              );
            },
            loading: () {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
