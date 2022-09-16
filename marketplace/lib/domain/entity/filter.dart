import 'package:marketplace/presentation/debugData.dart';

class Filter {
  late String title;
  late double minPrice;
  late double maxPrice;
  late double minYearOfRelease;
  late double maxYearOfRelease;
  late List<String> genre;
  late List<String> stylistics;
  late List<String> platforms;
  late List<String> multiplayer;

  Filter() {
    title = '';
    minPrice = 0;
    maxPrice = 100000;
    minYearOfRelease = 1967;
    maxYearOfRelease = DateTime.now().year.toDouble();
    genre = [];
    stylistics = [];
    platforms = [];
    multiplayer = [];
  }
}