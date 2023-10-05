class Event {
  final String id;
  final String bannerImage;
  final String title;
  bool isFav;
  Event({
    required this.id,
    required this.bannerImage,
    required this.title,
    this.isFav = false,

  });
}

List<Event> events = [
  Event(
      id: "5a0ccc3a-976f-47dd-9f93-a194aacc5efa",
      bannerImage:
          "https://cdn.subspace.money/whatsub_blogs/Disney%2BHotstar.jpg",
      title:
          "A three-month subscription to Disney+ Hotstar is available for Rs 151."),
  Event(
      id: "25acf661-33b9-4657-be58-fd65d758aca3",
      bannerImage:
          "https://cdn.subspace.money/grow90_tracks/images/T2TtkhkTLcCeVbteN8bP.png",
      title: "Top 5 movies to stream on first week of September 2022."),
  Event(
      id: "3f8c8d34-8bb3-424e-abdd-5732eca2c3c9",
      bannerImage: "https://cdn.subspace.money/whatsub_blogs/slate(1).png",
      title: "A guide to stepwise subscription through Subspace"),
  Event(
      id: "11cff945-c5df-4b71-bbe2-8fff16549ca4",
      bannerImage: "https://cdn.subspace.money/whatsub_blogs/slate(1).png",
      title: "How to get started ? 😕"),
];
