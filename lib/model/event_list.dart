import 'package:event_app/UI/screen_card.dart';
import 'package:event_app/fetch_event.dart';
import 'package:event_app/model/event.dart';
import 'package:event_app/screens/event_detail.dart';
import 'package:flutter/material.dart';

class EventListView extends StatelessWidget {
  final List<Event> events;

  const EventListView({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Event>>(
      future: fetchEvents(),
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
                      builder: (context) => EventDetailPage(event: event),
                    ),
                  );
                },
                child: SearchEventsCard(
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
    );
  }
}
