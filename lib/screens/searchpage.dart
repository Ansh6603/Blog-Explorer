import 'package:event_app/model/event_list.dart';
import 'package:event_app/model/event.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Event> events = []; 
  List<Event> filteredEvents = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredEvents = List.from(events);
  }

  void _updateFilteredEvents(String query) {
    if (query.isNotEmpty) {
      final searchQuery = query.toLowerCase();
      setState(() {
        filteredEvents = events.where((event) {
          final title = event.title.toLowerCase();
          return title.contains(searchQuery);
        }).toList();
      });
    } else {
      setState(() {
        filteredEvents = List.from(events);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        elevation: 0,
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: _updateFilteredEvents,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Type Event Name',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.blue,
                        size: 35.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: EventListView(events: filteredEvents),
            )
          ],
        ),
      ),
    );
  }
}
