import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:event_app/model/blog.dart';


Future<List<Event>> fetchBlogs() async {
  final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  final String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  try {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['blogs'];
      List<Event> events = data.map((blogData) => Event(
        id: blogData['id'],
        bannerImage: blogData['image_url'],
        title: blogData['title'],
      )).toList();
      return events;
    } else {
      throw Exception('Failed to load events');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
