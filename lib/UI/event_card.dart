import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class EventDetailCard extends StatelessWidget {
  final String bannerImage;
  final String title;
  final DateTime dateTime;
  final String venueName;
  final String venueCity;
  final String venueCountry;

  const EventDetailCard({
    super.key,
    required this.bannerImage,
    required this.title,
    required this.venueName,
    required this.venueCity,
    required this.dateTime,
    required this.venueCountry,
  });

  String formatEventDate(DateTime date) {
    final DateFormat formatter = DateFormat('E, MMM d');
    return formatter.format(date);
  }

  String extractTime(DateTime date) {
    DateTime dateTime = DateTime.parse(date.toString());
    DateFormat timeFormat = DateFormat.jm();
    return timeFormat.format(dateTime);
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength - 3)}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.04),
          width: 1.0,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: 35,
                height: 100,
                child: Image.network(
                  bannerImage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  '${formatEventDate(dateTime)} • ${extractTime(dateTime)}',
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 17, 141, 242),
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 8.0),
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_rounded,
                      color: Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      truncateText('$venueName • $venueCountry', 30),
                      style: GoogleFonts.notoSansThai(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
