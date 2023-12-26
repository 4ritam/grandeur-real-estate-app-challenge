import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/model/post.dart';

class PostPage extends StatelessWidget {
  final String id;
  final Post post;
  const PostPage({
    super.key,
    required this.id,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                post.title,
                style: const TextStyle(
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                    ),
                    Shadow(
                      blurRadius: 50.0,
                      color: Colors.black,
                    ),
                    Shadow(
                      blurRadius: 100.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              background: Hero(
                tag: post.images[0],
                child: CachedNetworkImage(
                  imageUrl: post.images[0],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Text(
                    post.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
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
