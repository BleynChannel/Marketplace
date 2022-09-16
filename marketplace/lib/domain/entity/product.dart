class Product {
  final String title;
  //! Debug
  final String pathToImage;
  final double price;
  final double oldPrice;
  final double discount;
  final DateTime releaseDate;
  final List<String> genre;
  final List<String> stylistics;
  final List<String> platforms;
  final List<String> multiplayer;

  Product({
    required this.title,
    required this.pathToImage,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.releaseDate,
    required this.genre,
    required this.stylistics,
    required this.platforms,
    required this.multiplayer,
  });
}
