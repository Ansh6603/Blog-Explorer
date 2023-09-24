import 'package:event_app/model/event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailPage extends StatefulWidget {
  final Event event;

  const EventDetailPage({super.key, required this.event});

  @override
  // ignore: library_private_types_in_public_api
  _EventDetailPageState createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  bool isExpanded = false;

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength - 3)}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Event Details',
          style: GoogleFonts.notoSansThai(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Container(
            height: 20,
            width: 50,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.grey.withOpacity(0.7),
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.transparent, width: 2.0),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 25.0,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                child: Image.network(
                  widget.event.bannerImage,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(26.0),
                  child: Text(
                    widget.event.title,
                    style: GoogleFonts.notoSansThai(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: widget.event.organiserIcon.endsWith('.svg')
                            ? SvgPicture.network(
                                widget.event.organiserIcon,
                                width: 100,
                                height: 80,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.event.organiserIcon,
                                width: 100,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.event.organiserName,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            'Organizer',
                            style: GoogleFonts.roboto(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          shape: BoxShape.rectangle,
                          color: Colors.grey.withOpacity(0.35),
                        ),
                        child: const Icon(
                          Icons.calendar_month_sharp,
                          size: 35.0,
                          color: Color.fromARGB(255, 3, 99, 178),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            DateFormat('dd MMMM, yyyy')
                                .format(widget.event.dateTime),
                            style: GoogleFonts.notoSansThai(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            DateFormat('EEEE, h:mm a')
                                .format(widget.event.dateTime),
                            style: GoogleFonts.notoSansThai(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          shape: BoxShape.rectangle,
                          color: Colors.grey.withOpacity(0.35),
                        ),
                        child: const Icon(
                          Icons.location_pin,
                          size: 35.0,
                          color: Color.fromARGB(255, 3, 99, 178),
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            truncateText(widget.event.venueName, 30),
                            style: GoogleFonts.notoSansThai(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                          Text(
                            '${widget.event.venueCity}, ${widget.event.venueCountry}',
                            style: GoogleFonts.notoSansThai(
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'About Event',
                    style: GoogleFonts.notoSansThai(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    widget.event.description,
                    style: GoogleFonts.notoSansThai(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 250,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 51, 73, 239),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  Text(
                    "BOOK NOW",
                    style: GoogleFonts.notoSansThai(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_circle_right_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
