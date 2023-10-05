import 'package:event_app/fetch_event.dart';
import 'package:event_app/model/blog.dart';
import 'package:event_app/screens/blog_detail.dart';
import 'package:flutter/material.dart';

class BlogListView extends StatelessWidget {
  final List<Event> events;

  const BlogListView({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
      future: fetchBlogs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Event> events = snapshot.data ?? [];
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final Event event = events[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlogDetailPage(event: event),
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.network(
                        event.bannerImage,
                        fit: BoxFit.cover,
                        height: 150, 
                      ),
                      ListTile(
                        title: Text(event.title),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
