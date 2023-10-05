import 'package:event_app/favourite_controller.dart';
import 'package:event_app/fetch_event.dart';
import 'package:event_app/model/blog.dart';
import 'package:event_app/screens/blog_detail.dart';
import 'package:event_app/screens/favourite_blog.dart';
import 'package:event_app/screens/help_support.dart';
import 'package:event_app/screens/searchpage.dart';
import 'package:event_app/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<String> menuItems = ['Settings', 'Help and Support'];

    void _handleMenuItemSelected(String selectedItem) {
      if (selectedItem == 'Settings') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Setting()),
        );
      } else if (selectedItem == 'Help and Support') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HelpAndSupport()),
        );
      }
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: isDarkMode ? Colors.black : Colors.blue.shade200,
          elevation: 0,
          title: Text(
            'Blogs and Articles',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              fontSize: 26,
              color: Colors.black,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SearchPage()),
                );
              },
              icon: Icon(
                Icons.search_outlined,
                color: isDarkMode ? Colors.white : Colors.black,
                size: 30,
              ),
            ),
            PopupMenuButton(
              iconSize: 30,
              color: Colors.black,
              itemBuilder: (BuildContext context) {
                return menuItems.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList();
              },
              onSelected: _handleMenuItemSelected,
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Merchants'),
              Tab(text: 'Business'),
              Tab(text: 'Tutorial'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            BlogList(category: 'All'),
            BlogList(category: 'Merchants'),
            BlogList(category: 'Business'),
            BlogList(category: 'Tutorial'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            List<Event> favoriteEvents =
                events.where((event) => event.isFav).toList();
            favoriteController.favoriteEvents.assignAll(favoriteEvents);
            Get.to(() => FavoriteBlogsScreen());
          },
          child: const Icon(Icons.favorite),
        ),
      ),
    );
  }
}

class BlogList extends StatelessWidget {
  final String category;

  const BlogList({required this.category});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
      future: fetchBlogs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Event> events = snapshot.data ?? [];
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              Event event = events[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => BlogDetailPage(event: event),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 200,
                          child: Image.network(
                            event.bannerImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            event.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
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
