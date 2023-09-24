class Event {
  final String bannerImage;
  final String title;
  final DateTime dateTime;
  final String venueName;
  final String venueCity;
  final String venueCountry;
  final String description;
  final String organiserName;
  final String organiserIcon;

  Event({
    required this.bannerImage,
    required this.title,
    required this.dateTime,
    required this.venueName,
    required this.venueCity,
    required this.venueCountry,
    required this.description,
    required this.organiserName,
    required this.organiserIcon,
  });
}

List<Event> events = [
  Event(
    bannerImage: 'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
    title: "Jo Malone London's Mother's Day Presents",
    dateTime: DateTime(2023, 04, 28, 17, 30),
    venueName: 'Radius Gallery',
    venueCity: 'Santa Cruz',
    venueCountry: 'CA',
    description: "Dummy description sjdjfuwfjwfghf",
    organiserName: 'The Internet Folks',
    organiserIcon: 'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
  ),
  Event(
    bannerImage: 'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
    title: 'A Virtual Evening of Smooth Jazz',
    dateTime: DateTime(2023, 05, 01, 18, 0),
    venueName: 'Lot 13',
    venueCity: 'Oakland 2',
    venueCountry: 'CA',
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    organiserName: 'The Internet Folks',
    organiserIcon: 'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
  ),
  Event(
    bannerImage: 'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
    title: "International Band Music Concert",
    dateTime: DateTime(2021, 12, 14, 16, 00),
    venueName: 'Gala',
    venueCity: '36 Guild',
    venueCountry: 'UK',
    description: "Dummy description",
    organiserName: 'The Internet Folks',
    organiserIcon: 'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
  ),
  Event(
    bannerImage: 'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
    title: "Jo Malone London's Mother's Day Presents",
    dateTime: DateTime(2023, 04, 28, 17, 30),
    venueName: 'Radius Gallery',
    venueCity: 'Santa Cruz',
    venueCountry: 'CA',
    description: "Dummy description",
    organiserName: 'The Internet Folks',
    organiserIcon: 'https://files.realpython.com/media/PyGame-Update_Watermarked.bb0aa2dfe80b.jpg',
  ),
];
