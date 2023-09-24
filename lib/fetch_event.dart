import 'package:event_app/model/event.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Event>> fetchEvents() async {
  final response = await http.get(
    Uri.parse(
      'https://sde-007.api.assignment.theinternetfolks.works/v1/event',
    ),
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    final List<dynamic> eventsData = data['content']['data'];

    List<Event> events = eventsData.map((eventData) => Event(
          bannerImage: eventData['banner_image'],
          title: eventData['title'],
          dateTime: DateTime.parse(eventData['date_time']),
          venueName: eventData['venue_name'],
          venueCity: eventData['venue_city'],
          venueCountry: eventData['venue_country'],
          description: eventData['description'],
          organiserName: eventData['organiser_name'],
          organiserIcon: eventData['organiser_icon'],
        )).toList();
    return events;
  } else {
    throw Exception('Failed to load events');
  }
}
