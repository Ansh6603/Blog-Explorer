import 'package:event_app/model/blog.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteEvents = <Event>[].obs;

  bool isFavorite(Event event) {
    return favoriteEvents.contains(event);
  }

  void toggleFavorite(Event event) {
    event.isFav = !event.isFav;
    if (isFavorite(event)) {
      favoriteEvents.remove(event);
    } else {
      favoriteEvents.add(event);
    }
    update();
  }
}
