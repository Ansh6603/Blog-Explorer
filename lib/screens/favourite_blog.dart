import 'package:event_app/model/blog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:event_app/favourite_controller.dart';

class FavoriteBlogsScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Blogs',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue.shade200,
      ),
      body: GetBuilder<FavoriteController>(
        builder: (controller) {
          if (controller.favoriteEvents.isEmpty) {
            return const Center(
                child: Text(
              'No favorite blogs yet.',
              style: TextStyle(color: Colors.black),
            ));
          }

          return ListView.builder(
            itemCount: controller.favoriteEvents.length,
            itemBuilder: (context, index) {
              Event event = controller.favoriteEvents[index];
              return ListTile(
                leading: Image.network(event.bannerImage,
                    width: 50, height: 50, fit: BoxFit.cover),
                title: Text(event.title),
              );
            },
          );
        },
      ),
    );
  }
}
