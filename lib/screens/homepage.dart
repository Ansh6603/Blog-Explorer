import 'package:event_app/UI/event_card.dart';
import 'package:event_app/fetch_event.dart';
import 'package:event_app/model/event.dart';
import 'package:event_app/screens/event_detail.dart';
import 'package:event_app/screens/help_support.dart';
import 'package:event_app/screens/searchpage.dart';
import 'package:event_app/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        elevation: 0,
        title: Text(
          'Events',
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FutureBuilder<List<Event>>(
          future: fetchEvents(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
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
                          builder: (context) => EventDetailPage(event: event),
                        ),
                      );
                    },
                    child: EventDetailCard(
                      bannerImage: event.bannerImage,
                      title: event.title,
                      venueName: event.venueName,
                      venueCity: event.venueCity,
                      dateTime: event.dateTime,
                      venueCountry: event.venueCountry,
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
