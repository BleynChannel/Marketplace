class Product {
  final String title;
  final String pathToImage;
  final double price;
  final double oldPrice;
  final double discount;
  final List<String> platforms;

  Product({
    required this.title,
    required this.pathToImage,
    required this.price,
    required this.oldPrice,
    required this.discount,
    required this.platforms,
  });
}
